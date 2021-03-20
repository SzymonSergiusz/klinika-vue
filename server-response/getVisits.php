<?php
header('Content-type: text/html; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
include "config.php";

$data = json_decode(file_get_contents('php://input'), TRUE);

$id = $data['id'];

$query = "SELECT `rezerwacje`.`id`,`rezerwacje`.`termin`, `lekarze`.`firstname`, `lekarze`.`surname`, `lekarze`.`specification` FROM `rezerwacje`, `lekarze` WHERE `rezerwacje`.`doctor_id` = `lekarze`.`id` AND `rezerwacje`.`user_id` = $id";
$result = mysqli_query($con, $query);
$rows = array();
while ($row = $result->fetch_assoc()) {
    $rows[] = $row;
}
echo json_encode($rows)

?>