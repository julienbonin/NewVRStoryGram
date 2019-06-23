<?php
include 'db_connection.php';

$sql = "select id from vrstorygram_users where username='johndoe' and password='J10r18B2'";
$stmt = $conn->prepare($sql);
$stmt->execute();

$entry = $stmt->

 ?>
