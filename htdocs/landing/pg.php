<?php
include 'connect.php';
$conn = OpenCon();
$game = "SELECT `G_id`, `name`, `Published_Year` FROM `game` WHERE 1 ";
$result = $conn->query($game);
if ($result->num_rows > 0) {
echo "<table><tr><th class='borderclass'>G_id</th><th class='borderclass'>Name</th><th class='borderclass'>Published_id</th></tr>";
// output data of each row
while($row = $result->fetch_assoc()) { echo
"</td><td class='borderclass'>".$row['G_id'].    
"</td><td class='borderclass'>".$row['name'].
"</td><td class='borderclass'> ".$row['Published_Year']."</td></tr></br>";
}
echo "</table>";
} else {
echo "0 results";
}
CloseCon($conn);
?>