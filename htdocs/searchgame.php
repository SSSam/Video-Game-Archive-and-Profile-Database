<link rel="stylesheet" href="table.css">

<?php
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
$att_cols = $_POST['game_name'];
$year_cols = $_POST['Published_Year'];
$conn = OpenCon();
$sql = "SELECT $att_cols 
FROM game, game_company, published_by 
WHERE Published_Year > $year_cols
AND published_by.G_id= game.G_id
AND published_by.C_id = game_company.C_id";
myTable($conn,$sql);

echo '<a href="landing/landing.html">Back to Main</a>';
echo '<a href="landing/input.html">Update Info</a>';
echo '<a href="search.html">Search Database</a>';
echo '<br></br>';
?>

