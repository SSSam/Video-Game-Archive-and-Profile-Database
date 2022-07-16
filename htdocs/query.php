<?php
include 'connect.php';
$conn = OpenCon();
$sql = "SELECT `G_id`, `name`, `Published_Year` FROM `game` WHERE 1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
//echo "<table><tr><th class='borderclass'>G_id</th><th class='borderclass'>game name</th><th class='borderclass'>game Published_id</th></tr>";
// output data of each row
while($row = $result->fetch_assoc()) { echo
"</td><td class='borderclass'>".$row['name'].
"</td><td class='borderclass'> ".$row['Published_Year']."</td></tr></br>";
}
echo "</table>";
} else {
echo "0 results";
}
CloseCon($conn);
?>