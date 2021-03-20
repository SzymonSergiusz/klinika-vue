<?php
header('Content-type: text/html; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "config.php";


$data = json_decode(file_get_contents('php://input'), TRUE);
$login = $data['login'];

$password = $data['password'];

// echo $login.' '.$password;

$userData = mysqli_query($con,'SELECT * from `users` WHERE `login`= "'.$login.'"');

if(mysqli_num_rows($userData) == 0) {
   echo json_encode([
      'succesfulLog' => false,
      'message' => 'Nie znaleziono uzytkownika'
   ]);
} else {
   $response = array();

   while($row = mysqli_fetch_assoc($userData)){
   
      $response[] = $row;
   }
   
   if ($response[0]['password'] == $password) {
      echo json_encode([
         'succesfulLog' => true,
         'id' => $response[0]['id'],
         'firstname' => $response[0]['firstname'],
         'message' => 'Witamy'
      ]);
   } else {
      echo json_encode([
         'succesfulLog' => false,
         'message' => 'Nieprawidłowe hasło'
      ]);
   }
}

// echo $condition;


// echo json_encode($response);

exit;
?>