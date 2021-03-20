<?php
header('Content-type: text/html; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "config.php";
$response = [
    'succesful'=> false,
    'message' => ''
];
$data = json_decode(file_get_contents('php://input'), TRUE);

$firstname = $data['firstname'];
$surname = $data['surname'];
$login = $data['login'];
$password = $data['password'];
$passwordValid = $data['passwordValid'];

if (strlen($firstname) == 0) {
    $response['message'] = 'Imię nie może być puste';
}
else if (strlen($surname) == 0) {
    $response['message'] = 'Nazwisko nie może być puste';
}
else if (strlen($login) == 0) {
    $response['message'] = 'Login nie może być pusty';
}

else if ($password != $passwordValid || strlen($password) == 0) {
    $response['message'] = 'Wpisz poprawnie hasło';
}

else {
    $query = "INSERT INTO `users` VALUES(DEFAULT, '$firstname', '$surname', '$login', '$password')";
    mysqli_query($con, $query);
    $response['succesful'] = true; //todo
    $response['message'] = 'Rejestracja sie powiodla';
}

echo json_encode($response);
exit;
?>