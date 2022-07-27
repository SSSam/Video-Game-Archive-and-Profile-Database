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
include 'connect.php';
$condition = $_POST['Rating_Constraint'];
$conn = OpenCon();
$sql = "SELECT game_name as Game, 
Popularity as 'Popularity: Monthly Active Users'
FROM game, game_pop
WHERE game.G_id= game_pop.G_id
AND popularity > $condition
GROUP BY game_name 
ORDER BY popularity DESC";

buildTable($conn,$sql);
echo "<br>";
echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';

CloseCon($conn);
//
?>


