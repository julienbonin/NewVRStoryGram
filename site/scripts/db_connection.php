<?php

$servername = "127.0.0.1";
$dbName = "ideaspace";
$username = "julienbonin";
$password = "J10r18B2";

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbName", $username, $password);

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//  echo "Successful Connection to database";

//  echo "Connected Successfull";
}
catch (PDOException $e) {
//  echo "Connection Failed: " . $e->getMessage();
}
?>
