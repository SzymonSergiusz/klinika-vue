<?php
header('Content-type: text/html; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
include "config.php";

$data = json_decode(file_get_contents('php://input'), TRUE);
$id = $data['id'];

$query_del = "DELETE FROM `rezerwacje` WHERE `id` = $id";

$query_termin = "SELECT `termin` FROM `rezerwacje` WHERE `id` = $id";
$result = mysqli_query($con, $query_termin);
$row = $result->fetch_row();
$termin = $row[0];
$query_cancel = 'UPDATE `terminy` SET `is_booked` = 0 WHERE `registration_time` ='."'$termin'";

mysqli_query($con, $query_cancel);
mysqli_query($con, $query_del);

?>