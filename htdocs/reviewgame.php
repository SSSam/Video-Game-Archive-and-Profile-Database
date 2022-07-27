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


$user = $_POST['User_ID'];
$game = $_POST['G_ID'];
$rating = $_POST['Rating'];

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);

$stmt = $conn->prepare(
    "INSERT INTO rate( G_id, User_id, User_rating )
    values (?, ?, ?)");

$stmt->bind_param("iii", $game, $user, $rating);
$stmt->execute();


echo "<h1>Input Successfully... </h1><br>";
echo '<a href="landing/landing.html">Back to main</a><br>';
echo '<a href="database.php">See Updated Database</a>';
$conn -> close();
?>