<?php
$hostip = "172.17.0.1"; //docker0 ip
$port = 5548;
$username = "user";
$password = "password";
$database = "boolean_injection";


$db = new mysqli($hostip, $username, $password, $database, $port);
if (mysqli_connect_errno()) { #检查连接
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query = "SELECT * FROM users WHERE username='$username' and password='$password';";
    $result = $db->query($query);
    if ($result->num_rows == 0) {
        echo "fail<br>";
    } else {
        echo "success<br>";
    }
}
?>

<h1>Boolean Injection-Can you capture the flag?</h1>
<form method="post">
    <label>username</label><input type="text" name="username" />
    <label>password</label><input type="password" name="password">
    <input class="button" type="submit" name="submit" value="登录" />
</form>