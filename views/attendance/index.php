<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance</title>

    <!-- Include jQuery from a CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Include Bootstrap JS if needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Include the jsQR library -->
    <script src="https://unpkg.com/jsqr/dist/jsQR.js"></script>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="box box-solid">
            <?php if (count($this->events) > 0): ?>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-7">
                        <div class="box box-solid box-info">
                            <div class="box-header with-border">
                                <h4 class="box-title">Event</h4>
                                <p class="no-margin pull-right">Officer Name: <?php echo ucwords(Session::get('firstname') . " " . Session::get('lastname')); ?></p>
                            </div>
                            <div class="box-body">
                                <form method="post" action="<?php echo URL; ?>attendance/scan" id="attendanceForm">
                                <div class="form-group">
                                    <label class="control-label">Event NamesaxfzFDFdfD</label>
                                    <?php if (count($this->events) == 1): ?>
                                    <input type="hidden" name="eventid" value="<?php echo $this->events[0]['eventid']; ?>" />
                                     <input type="text" readonly class="form-control" value="<?php echo $this->events[0]['event_name']; ?>" />

                                    <?php else: ?>
                                    <select class="form-control" name="eventid">
                                        <?php foreach ($this->events as $event): ?>
                                        <option value="<?php echo $event['eventid']; ?>"><?php echo $event['event_name']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <?php endif; ?>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="qrcode"  id="txtQrcode" placeholder="Scan QR Code" />
                                </div>
                            </form>
                                <div id="previewArea"></div>
                                <video id="video" style="display:none; width:100%; max-height: 400px;" autoplay></video> <!-- Video element for camera feed -->
                                <button class="btn btn-success" id="startScanButton">Scan QR Code</button> <!-- New button for scanning -->
                                <button class="btn btn-danger" id="stopScanButton" style="display:none;">Close Camera</button> <!-- Button to close camera -->
                                <button class="btn btn-info" data-toggle="modal" data-target="#studentInfoModal" id="viewStudentInfo">View Student Info</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="box box-solid box-success">
                            <div class="box-header with-border">
                                <h4 class="box-title">Students that have Logged In</h4>
                            </div>
                            <div class="box-body" id="studentsListsEventAttendance">
                                <p class="alert alert-info no-margin">There are no students yet</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay hidden">
                <i class="fa fa-refresh fa-spin"></i>
            </div>
            <?php else: ?>
            <p class="alert alert-info">There are no events assigned for you</p>
            <?php endif; ?>
        </div>
    </div>
</div>

<!-- Modal for Student Information -->
<div class="modal fade" id="studentInfoModal" tabindex="-1" role="dialog" aria-labelledby="studentInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="studentInfoModalLabel">Student Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="studentInfoContent">
                <!-- Student info will be loaded here via AJAX -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Include your custom script -->
<script>
$(document).ready(function() {
    const videoElement = document.getElementById('video'); // Use the video element from the DOM
    const canvasElement = document.createElement('canvas');
    const canvasContext = canvasElement.getContext('2d');
    canvasElement.willReadFrequently = true; // Set the willReadFrequently attribute

    // Function to start camera for QR code scanning
    function startCamera() {
        navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' } })
        .then(function(stream) {
            videoElement.srcObject = stream;
            videoElement.setAttribute("playsinline", true); // Required to tell iOS to use inline video
            videoElement.style.display = "block"; // Show the video element
            videoElement.play();
            requestAnimationFrame(tick);
            $('#stopScanButton').show(); // Show the stop button
            $('#startScanButton').hide(); // Hide the start button
        })
        .catch(function(error) {
            console.error("Error accessing the camera: ", error);
            alert('Unable to access camera. Please ensure camera is connected and permissions are granted.');
        });
    }

    // QR code scanning process
    function tick() {
        if (videoElement.readyState === videoElement.HAVE_ENOUGH_DATA) {
            canvasElement.height = videoElement.videoHeight;
            canvasElement.width = videoElement.videoWidth;
            canvasContext.drawImage(videoElement, 0, 0, canvasElement.width, canvasElement.height);
            const imageData = canvasContext.getImageData(0, 0, canvasElement.width, canvasElement.height);
            const code = jsQR(imageData.data, imageData.width, imageData.height);

            if (code) {
                $('#txtQrcode').val(code.data); // Populate input with scanned value
                $('#attendanceForm').submit(); // Automatically submit the form
                
                // Do NOT stop the camera here to keep it active
                // Load attendance after scan
                loadEventAttendance();
            }
        }
        requestAnimationFrame(tick); // Keep scanning even after successful scan
    }

    // Function to stop the camera
    function stopCamera() {
        const stream = videoElement.srcObject;
        if (stream) {
            const tracks = stream.getTracks();
            tracks.forEach(track => track.stop());
            videoElement.srcObject = null;
            videoElement.style.display = "none"; // Hide the video element after stopping
            $('#stopScanButton').hide(); // Hide the stop button
            $('#startScanButton').show(); // Show the start button again
        }
    }

    // Start camera on button click
    $('#startScanButton').on('click', function() {
        startCamera();
    });

    // Stop camera on button click
    $('#stopScanButton').on('click', function() {
        stopCamera();
    });

    // Handle form submission for viewing student info
    $('#attendanceForm').submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        var qrcode = $('#txtQrcode').val(); // Get the qrcode input
        if (qrcode) {
            $.ajax({
                url: "<?php echo URL; ?>attendance/scan",
                method: "POST",
                data: $(this).serialize(),
                success: function(data) {
                    // Populate the modal with the student info returned from scan.php
                   // $('#studentInfoContent').html(data);
                    
                    // Open the modal
                    $('#studentInfoModal').modal('show');

                    loadEventAttendance();
                    clearInputField();
                },
                error: function() {
                    alert('Error retrieving student info.');
                }
            });
        } else {
            alert('Please enter a Qrcode.');
        }
    });

     var studentId = 0;

     // Event listener to submit form when event name input changes
    $('#txtQrcode').on('input', function() {
        studentId = $(this).val();
        $('#attendanceForm').submit(); // Automatically submit the form
    });

    // Function to clear the input field
    function clearInputField() {
    $('#txtQrcode').val(''); // Clear the text input field
    }

     function loadEventAttendance(studentId=0)
    {
        //$(".overlay").removeClass('hidden');
        var eventId = ($("input[name='eventid']").length == 1) ? $("input[name='eventid']").val() : $("select[name='eventid']").val();
        $.get(window.siteurl + 'attendance/loadEventAttendance/' + eventId + "/" + studentId, function(result){
            $("#studentsListsEventAttendance").html(result);
           // $(".overlay").addClass('hidden');
        });
    }

    
});
</script>
</body>
</html>
