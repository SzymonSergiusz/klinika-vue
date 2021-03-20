<?php
header('Content-type: text/html; charset=utf-8');
header("Access-Control-Allow-Origin: *");
include "config.php";

$query = "SELECT * FROM `lekarze`";
$result = mysqli_query($con, $query);

$rows = array();
while ($row = $result->fetch_assoc()) {

    $query_terminy = 'SELECT * FROM `terminy` WHERE `id_lekarza` ='.$row["id"].' AND `is_booked` = 0';

    $res_terminy = mysqli_query($con, $query_terminy);

    $rows_terminy = array();
    
    while($row_terminy = $res_terminy->fetch_assoc()) {
        $rows_terminy[] = array("id_lekarza" => $row_terminy["id_lekarza"],
    "registration_time" => $row_terminy["registration_time"], "is_booked" => $row_terminy["is_booked"]);
    }


    $assoc = array(
        "id" => $row["id"],
        "firstname" => $row["firstname"],
        "surname" => $row["surname"],
        "specification" => $row["specification"],
        "terminy" => $rows_terminy,

    );
    $rows[] = array_filter($assoc);    

}
echo json_encode($rows);

?>