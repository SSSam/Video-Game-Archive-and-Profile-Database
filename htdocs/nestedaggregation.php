<link rel="stylesheet" href="table.css">

<?php
function buildTable($obConn,$sql)
{
$conn = mysqli_query($obConn, $sql) or die(mysqli_error($obConn));
if(mysqli_num_rows($conn)>0)
{
echo "<table width=\"100%\" border=\"0\"
cellspacing=\"2\"
cellpadding=\"0\"><tr align=\"center\">";
$i = 0;
//Get field names
while ($i < mysqli_num_fields($conn)){
    $field = mysqli_fetch_field_direct($conn, $i);
    $fieldName=$field->name;
    echo "<th><strong>$fieldName</strong></th>";
    $i = $i + 1;
    }
    echo "</tr>";
    //output data
    while ($row = mysqli_fetch_assoc($conn)) {
    echo "<tr>";
    foreach($row as $data) {
    echo "<td>$data</td>";
    }
    echo "</tr>";
    }
    echo "</table>";
}
}

//Outputting the game name and rating with the highest ratings of all games 
//(nested aggregation)
include 'connect.php';
$conn = OpenCon();

$bestgame= "SELECT 
max(avggame.avgrate) as 'Best Game Rating',
min(avggame.avgrate) as 'Worst Game Rating'
FROM (
    SELECT Avg(user_rating) as avgrate 
    FROM game, rate 
    WHERE game.G_id= rate.g_id 
    GROUP BY game.g_id) avggame";


buildTable($conn, $bestgame);
echo "<br>";

$game= "SELECT game.game_name as Game, 
Avg(user_rating) as 'Average Rating' 
FROM game, rate 
WHERE game.G_id= rate.g_id 
GROUP BY game.g_id";
buildTable($conn, $game);

echo "<br>";

echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';
?>


