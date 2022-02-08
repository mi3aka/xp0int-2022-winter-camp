<?php
highlight_file(__FILE__);
$hostip = "172.17.0.1"; //docker0 ip
$port = 5548;
$username = "user";
$password = "password";
$database = "constraint_based_attack";

$db = new mysqli($hostip, $username, $password, $database, $port);
if (mysqli_connect_errno()) { #检查连接
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if (empty($_POST['username']) || empty($_POST['password'])) {
    exit();
}
$username = mysqli_real_escape_string($db, $_POST['username']);
$password = mysqli_real_escape_string($db, $_POST['password']);
if ($username !== "admin") {
    die();
}
$query = "select * from users where username = '$username' and password='$password';";
$result = $db->query($query);
if ($result->num_rows !== 0) {
    var_dump($result->fetch_row());
    highlight_file("flag.php");
}
