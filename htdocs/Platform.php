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

function myTable($obConn,$sql)
{
$rsResult = mysqli_query($obConn, $sql) or die(mysqli_error($obConn));
if(mysqli_num_rows($rsResult)>0)
{
//We start with header. >>>Here we retrieve the fieldnames<<< 
echo "<table width=\"100%\" border=\"0\"
cellspacing=\"2\"
cellpadding=\"0\"><tr align=\"center\">";
$i = 0;
while ($i < mysqli_num_fields($rsResult)){
    $field = mysqli_fetch_field_direct($rsResult, $i);
    $fieldName=$field->name;
    echo "<th><strong>$fieldName</strong></th>";
    $i = $i + 1;
    }
    echo "</tr>";
    //>>>Field names retrieved<<<
    //We dump info
    while ($row = mysqli_fetch_assoc($rsResult)) {
    echo "<tr>";
    foreach($row as $data) {
    echo "<td>$data</td>";
    }
    echo "</tr>";
    }
    echo "</table>";
}
}

include 'connect.php';
$conn = OpenCon();
$table= $_POST['join_table'];

if($table == 'PC')
$result_sql =
"SELECT game.game_name as 'Game Name', `CPU`, `GPU`, `RAM`
FROM game, $table
JOIN runs on runs.Model_id = $table.Model_id
JOIN platform on platform.Model_id = $table.Model_id
Where game.G_id= runs.G_id";

else if ($table == "Console"){
$result_sql =
"SELECT game.game_name as 'Game Name', `Generation`
FROM game, $table
JOIN runs on runs.Model_id = $table.Model_id
JOIN platform on platform.Model_id = $table.Model_id
Where game.G_id= runs.G_id";
}
else if($table== "Mobile"){
$result_sql =
"SELECT game.game_name as 'Game Name', `OS`
FROM game, $table
JOIN runs on runs.Model_id = $table.Model_id
JOIN platform on platform.Model_id = $table.Model_id
Where game.G_id= runs.G_id";
}

myTable($conn,$result_sql);



echo '<br></br>';

echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';


?>
