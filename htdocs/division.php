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
//select user-id from user, and g-id and user id from rate, / g-id  in  game
//showing all the  user id's and names of users that have rated all games 
include 'connect.php';
$conn = OpenCon();
// $sql = "SELECT 'user_id', `userName` FROM users
// WHERE `user_id` not in ( SELECT `user_id` FROM( (SELECT `user_id`,g_id FROM (SELECT g_id FROM rate) as p 
// cross join
// (SELECT distinct `user_id` from users) as sp) 
// EXCEPT 
// (SELECT g_id, `user_id` FROM rate)) AS r)";

$sqlFinal="SELECT  `userName` as 'All the users who rated All the games in this database' 
FROM users as s
WHERE NOT EXISTS (
    ( SELECT rated.g_id FROM rate as rated)
    EXCEPT 
    (SELECT SP.g_id FROM rate SP WHERE SP.user_id= s.user_id))";

buildTable($conn,$sqlFinal);
CloseCon($conn);

echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';
?>


