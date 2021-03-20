<?php
header('Content-type: text/html; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
include "config.php";


$data = json_decode(file_get_contents('php://input'), TRUE);

$user_id = $data['id_uzytkownika'];
$doctor_id = $data['id_lekarza'];
$time = $data['registration_time'];
$query_booking = 'UPDATE `terminy` SET `is_booked` = 1 WHERE `registration_time` ='."'$time'";
$query_user_booking =  "INSERT INTO `rezerwacje` VALUES (DEFAULT, $user_id, $doctor_id, '$time')";
echo $query_user_booking;

mysqli_query($con, $query_booking);
mysqli_query($con, $query_user_booking);



?>