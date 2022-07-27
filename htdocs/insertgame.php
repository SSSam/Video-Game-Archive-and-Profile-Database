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


$name = $_POST['gameName'];
$Published_Year = $_POST['year'];

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);

$stmt = $conn->prepare(
    "INSERT INTO game( game_name, Published_Year) 
     value(?, ?)");

$stmt->bind_param("si", $name, $Published_Year);
$stmt->execute();

echo "<h1>Input Successfully...</h1><br> ";

echo '<a href="landing/landing.html">Back to main</a><br>';
echo '<a href="database.php">See Updated Database</a>';
$conn -> close();
?>