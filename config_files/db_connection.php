<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
//error_reporting(0);
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);

//connnection for local
$mysqli = mysqli_connect("localhost", "root", "", "test");

//connection for server
//$mysqli = mysqli_connect("localhost", "root", "Password@2019", "ted_website");

//$mysqli->set_charset('charset');
// Check connection
if($mysqli === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>