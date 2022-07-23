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


$name = $_POST['userName'];
$Joined_Year = $_POST['year'];

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);

$stmt = $conn->prepare("INSERT INTO users( userName, Year_joined)
    value(?, ?)");
$stmt->bind_param("si", $name, $Joined_Year);
$stmt->execute();

echo "Input Successfully... ";
echo '<a href="landing/landing.html">Back to main</a><br>';
echo '<a href="database.php">See Updated Database</a>';
$conn -> close();
?>