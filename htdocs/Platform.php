<link rel="stylesheet" href="table.css">

<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$db = "video_game";

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);
echo '<br>';
echo '<h1>Video Game Platform Database</h1>';
echo '<br>';

$pc_game =
"SELECT `game_name`, `CPU`, `GPU`, `RAM`
FROM game, runs, platform, pc
WHERE game.G_id = runs.G_id
AND runs.Model_id = pc.Model_id
AND platform.Model_id = pc.Model_id";

$result = $conn->query($pc_game);
if ($result->num_rows > 0) {
    echo "<table><tr>
    <th>Game Name</th>
    <th>PC </th>
    <th>GPU </th>
    <th>RAM </th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo
    "</td><td>".$row['game_name'].
    "</td><td>".$row['CPU'].
    "</td><td>".$row['GPU'].
    "</td><td>".$row['RAM'].
    "</tr>";
    }
    echo "</table>";}
echo '<br></br>';

$console_game =
"SELECT `game_name`, `Generation`
FROM game, runs, platform, console
WHERE game.G_id = runs.G_id
AND runs.Model_id = console.Model_id
AND platform.Model_id = console.Model_id";

$result = $conn->query($console_game);
if ($result->num_rows > 0) {
    echo "<table><tr>
    <th>Game Name</th>
    <th>Generation </th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo
    "</td><td>".$row['game_name'].
    "</td><td>".$row['Generation'].
    "</tr>";
    }
    echo "</table>";}
echo '<br></br>';

$mobile_game =
"SELECT `game_name`, `OS`
FROM game, runs, platform, mobile
WHERE game.G_id = runs.G_id
AND runs.Model_id = mobile.Model_id
AND platform.Model_id = mobile.Model_id";

$result = $conn->query($mobile_game);
if ($result->num_rows > 0) {
    echo "<table><tr>
    <th>Game Name</th>
    <th>OS </th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo
    "</td><td>".$row['game_name'].
    "</td><td>".$row['OS'].
    "</tr>";
    }
    echo "</table>";}
echo '<br></br>';

echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';


?>
