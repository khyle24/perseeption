<?php
$servername="https://db.skidax.com/";
$username="perseeption.com";
$password="74c873c72892";
$dbname="admin_announcement";
$conn = new mysqli($servername,$username,$password,$dbname);


if($conn->connect_error)
{
die("connection failed:". $conn->connect_error);
}
$sql="SELECT * FROM admin_announcement";
$result= $conn->query($sql);
$response=array();
if($result->num_rows>0)
{
while($row=$result->fetch_assoc())
{
array_push($response,$row);
}
}
$conn->close();
header('Content=Type: application/json');
echo json_encode($response);

?>