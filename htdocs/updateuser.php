<link rel="stylesheet" href="table.css">
<?php
// include 'connect.php';
// $conn = OpenCon();
// Don't forget to properly escape your values before you send them to DB
// to prevent SQL injection attacks.

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$db = "video_game";


$ID = $_POST['User_ID'];
$newName = $_POST['NewName'];

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);

$updateName= 'UPDATE users 
SET userName= ? WHERE User_id= ?';
$stmt= $conn->prepare($updateName);
$stmt->bind_param('si', $newName, $ID);
$stmt->execute();

echo "Update Successfully... ";
echo '<a href="landing/landing.html">Back to main</a>';
$conn -> close();
?>