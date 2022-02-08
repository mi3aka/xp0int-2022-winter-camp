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
var_dump($username);
var_dump($password);
$query = "select * from users where username = '$username'";
$result = $db->query($query);
if ($result->fetch_row()) {
    die('已存在该用户');
} else {
    $query = "insert into users (`username`,`password`) values('$username','$password')";
    $db->query($query);
    die('注册成功');
}
