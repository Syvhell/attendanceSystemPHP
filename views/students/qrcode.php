<style>
@page {
    margin: 0px;
    size: 158px 235px;
}
</style>
<div style="padding: 5px; width: 158px; border: 1px solid #000; border-radius: 5px; height: 233px;">
    <p style="padding: 5px; background-color: #193588 !important; font-size: 8px; font-weight: bold; text-align: center; color: #fff !important;">ID CARD</p>
    <p style="text-align: center">
        <img style='height: 80px' src="<?php echo URL . "public/"; ?><?php echo ($this->student['image'] != "") ? "uploads/student/" . $this->student['image'] : "no-image.gif"; ?>" />
    </p>
    <p style="margin-bottom: 5px; font-size: 8px; height: 10px; word-wrap: break-word; width: 100%; text-align: center; background-color: #c0c0c0 !important; padding: 5px; font-weight: bold; text-transform: uppercase;">
        <?php echo ucwords($this->student['lastname']); ?>, <?php echo ucwords($this->student['firstname']); ?><?php echo ucwords(($this->student['middlename'] != "") ? " " . substr($this->student['middlename'], 0, 1) . ". " : " "); ?>
    </p>
    <p style="text-align: center; font-weight: bold; text-transform: uppercase; font-size: 8px;">
        <?php echo $this->student['course_name']; ?> <?php echo $this->student['year']; ?><?php echo $this->student['section']; ?>
    </p>
    <p style="text-align: center;">
        <?php
        require 'vendor/autoload.php'; // If using endroid/qr-code via Composer

        use Endroid\QrCode\Builder\Builder;
        
        // Generate QR code for student 
        $qrCode = Builder::create()
            ->data($this->student['barcode']) // or any other data you want to encode
            ->size(50)
            ->margin(0)
            ->build();
        
        // Display the QR code as a base64 image
        echo "<img src='data:image/png;base64," . base64_encode($qrCode->getString()) . "' />";
        ?>
    </p>
    <!-- <p style="text-align: center; margin-bottom: 0px; font-size: 8px;">Student ID: <?php echo $this->student['barcode']; ?></p> -->
</div>
