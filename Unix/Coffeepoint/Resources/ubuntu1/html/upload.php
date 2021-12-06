<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["resume"]["name"]);
$errorMsg = "";
if(isset($_POST["submit"])) {
	// Check if file already exists
	if (file_exists($target_file)) {
	  $errorMsg = "Sorry, a file by that name already exists. Please change the filename and try again.";
	} else {
  		if (move_uploaded_file($_FILES["resume"]["tmp_name"], $target_file)) {
				$errorMsg = "The file ". htmlspecialchars( basename( $_FILES["resume"]["name"])). " has been uploaded to " . htmlspecialchars($target_file);
 		 } else {
				$errorMsg = "Sorry, there was an error uploading your file.";
  		}
	}
	$dest = "index.php?errorMsg=" . urlencode($errorMsg) . "#alert";
	header("Location: " . $dest,TRUE,307);
	//echo "Location: " . $dest;
	exit;
}
?>