<?php
$conn = new mysqli('localhost','root','ammireddy','reddy');
$userId = $_POST['userId'];
$userName = $_POST['userName'];
$userPassword = $_POST['userPassword'];
$state = $_POST['state'];
$district= $_POST['district'];
$pincode = $_POST['pincode'];
$dob = $_POST['dob'];
$phoneNo = $_POST['phoneNo'];
$gender = $_POST['gender'];

if($conn->connect_error){
    echo "$conn->connect_error";
    die("Connection Failed : ". $conn->connect_error);
} else {
    $stmt = $conn->prepare("insert into clients(userId, userName, ,userPassword,state,district,pincode,dob,phoneNo,gender) values(?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("issssisis", $userId, $userName, $userPassword, $state, $district, $pincode,$dob,$phoneNo,$gender);
    $execval = $stmt->execute();
    echo $execval;
    echo "Registration successfully...";
    $stmt->close();
    $conn->close();
    mysql_close($connection);
}

?>