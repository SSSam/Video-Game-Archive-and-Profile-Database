<link rel="stylesheet" href="table.css">

<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$db = "video_game";

$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n".
$conn -> error);
echo '<br>';
echo '<h1>General Video Game Database</h1>';
echo '<br>';

$game_C = 
"SELECT `g_id`, `game_name`, `Published_Year`
FROM game";
$result = $conn->query($game_C);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th>Game ID</th>
    <th>Game Name</th>
    <th>Published Year </th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "<td>".$row['g_id'].
    "<td>".$row['game_name'].
    "<td> ".$row['Published_Year'].
    "</tr>";
    }
    echo "</table>";}
echo '<br></br>';

$game_C = 
"SELECT `game_name`, `Published_Year`, `C_name` 
FROM game, game_company, published_by 
WHERE published_by.G_id= game.G_id
AND published_by.C_id = game_company.C_id ";
$result = $conn->query($game_C);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th>Game Name</th>
    <th>Published Year </th>
    <th>Published By</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "<td>".$row['game_name'].
    "<td> ".$row['Published_Year'].
    "<td> ".$row['C_name'].
    "</tr>";
    }
    echo "</table>";}
echo '<br></br>';

$user = 
"SELECT `User_id`, `userName`, `Year_joined` 
FROM users";
$result = $conn->query($user);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th >User_id</th>
    <th >userName</th>
    <th >Joined Year</th></tr>
    ";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "<td>".$row['User_id'].
    "<td> ".$row['userName'].
    "<td> ".$row['Year_joined'].
    "</tr>";
    }
    echo "</table>";}
    echo '<br></br>';

$Genre = 
"SELECT genre.Genre_id, `Genre_Type`, `game_name`
FROM genre, part_of, game 
WHERE part_of.Genre_id= genre.Genre_id
AND part_of.G_id = game.G_id
ORDER BY genre.genre_ID ASC";
$result = $conn->query($Genre);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th >Genre ID</th>
    <th >Genre Type</th>
    <th >Game Name</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "</td><td>".$row['Genre_id'].
    "</td><td>".$row['Genre_Type'].
    "</td><td> ".$row['game_name'].
    "</tr>";
    }
    echo "</table>";
}
echo '<br></br>';

$user_prefer =
"SELECT `userName`, genre1.Genre_Type AS 'Tag1', genre2.Genre_Type AS 'Tag2', genre3.Genre_Type AS 'Tag3'
FROM (users, prefer_preference, genre)
LEFT JOIN genre genre1 ON genre1.Genre_id = prefer_preference.Game_tag_1
LEFT JOIN genre genre2 ON genre2.Genre_id = prefer_preference.Game_tag_2 
LEFT JOIN genre genre3 ON genre3.Genre_id = prefer_preference.Game_tag_3
WHERE users.User_id = prefer_preference.User_id
GROUP BY users.userName";

$result = $conn->query($user_prefer);
if ($result->num_rows > 0) {
    echo "<table><tr>
    <th>User Name</th>
    <th>Tag 1 </th>
    <th>Tag 2 </th>
    <th>Tag 3 </th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo
    "</td><td>".$row['userName'].
    "</td><td>".$row['Tag1'].
    "</td><td>".$row['Tag2'].
    "</td><td>".$row['Tag3'].
    "</tr>";
    }
    echo "</table>";
}
echo '<br></br>';

$Collaborate = 
"SELECT A.C_name AS C_name1, B.C_name AS C_name2
FROM game_company A, game_company B, collaborate 
WHERE collaborate.A_C_id= A.C_id
AND collaborate.B_C_id= B.C_id";
$result = $conn->query($Collaborate);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th >Company</th>
    <th >Collaborate With</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "<td>".$row['C_name1'].
    "</td><td> ".$row['C_name2'].
    "</tr>";
    }
    echo "</table>";
}
echo '<br></br>';

$GameRate = 
"SELECT game_name, AVG(User_rating) AS avgrating, count('*') AS 'Total Number of Rating' 
FROM game, rate 
WHERE game.G_id= rate.g_id
GROUP BY game_name";
$result = $conn->query($GameRate);
if ($result->num_rows > 0) {
    echo "<table><tr> 
    <th >Game Name</th>
    <th >Rating</th>
    <th >Number of Rating</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) { 
    echo 
    "<td>".$row['game_name'].
    "</td><td> ".$row['avgrating'].
    "</td><td align= 'right'> ".$row[ 'Total Number of Rating'].
    "</tr>";
    }
    echo "</table>";
}
echo '<br></br>';
echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search in Database</a>';
echo '<br></br>';
?>
