<?php
include "db_connection.php";

$username = $_POST['username'];
$password = $_POST['password'];

# Validate username
$sql = "SELECT 1 FROM vrstorygram_users WHERE username='$username' and password='$password'";
$stmt = $conn->prepare($sql);
$stmt->execute();
$n = $stmt->rowCount();
if ($n < 1) {
  echo "These credentials don't match our records.";
  exit();
}
else { echo "You're logged in!";}

# Select the row for data manipulation
$sql = "SELECT * from vrstorygram_users where username='$username' and password='$password'";
$stmt = $conn->query($sql);

# Assign the user entry row to a variable for manipulation
$user_row = $stmt->fetch();

# Determine what page is served to the type of user
$user_type = $user_row[8];
$user_name = $user_row[2] . " " . $user_row[3];
if ($user_type === "student") {
  header("Location: /site/inc/userAccount_Student.php? name=$user_name");
}
elseif ($user_type === "educator") {
  header("Location: /site/inc/userAccount_Educator.php? name=$user_name");
}
elseif ($user_type === "admin") {
  header("Location: /site/inc/userAccount_Admin.php? name=$user_name");
}
 ?>
