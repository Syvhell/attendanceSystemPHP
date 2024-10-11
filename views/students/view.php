<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-body">
			<p class="text-center">
				<img style='height: 300px; width:500px' src="<?php echo URL; ?>public/<?php echo ($this->student['image'] != "") ? "uploads/student/" . $this->student['image'] : "no-image.gif"; ?>" />
			</p>
			<h4 class="text-center"><?php echo ucwords($this->student['firstname']); ?><?php echo ucwords(($this->student['middlename'] != "") ? " " . $this->student['middlename'] . " " : " "); ?><?php echo ucwords($this->student['lastname']); ?></h4>
			<h5 class="text-center"><?php echo $this->student['course_name']; ?> <?php echo $this->student['year']; ?>-<?php echo $this->student['section']; ?></h5>
			<p class="text-center">
			<?php
        	require 'vendor/autoload.php'; // If using endroid/qr-code via Composer

       		use Endroid\QrCode\Builder\Builder;
        
        	// Generate QR code for student 
        	$qrCode = Builder::create()
            ->data($this->student['barcode']) // or any other data you want to encode
            ->size(200)
            ->margin(0)
            ->build();
        
        	// Display the QR code as a base64 image
        	echo "<img src='data:image/png;base64," . base64_encode($qrCode->getString()) . "' />";
        	?>
		</div>
		<div class="modal-footer text-right">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>