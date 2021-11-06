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

const db = mysql.createConnection({
  host: "us-cdbr-east-04.cleardb.com",
  port: 3306,
  user: "bc62b0ccf843e4",
  password: "8a4f31cb",
  database: "heroku_ac00d9532dbe104",
});