<?php
$hostip = "172.17.0.1"; //docker0 ip
$port = 5548;
$username = "user";
$password = "password";
$database = "unkown_column_name_injection";


$db = new mysqli($hostip, $username, $password, $database, $port);
if (mysqli_connect_errno()) { #检查连接
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if (isset($_POST['username'])) {
    $username = $_POST['username'];
    if (stripos($username, 'or') !== false) {
        die("NO 'or' in username");
    }
    $query = "SELECT * FROM users WHERE username='$username';";
    $result = $db->query($query);
    if ($db->error) {
        echo "Error message: " . $db->error . "<br>";
    } else {
        $row = $result->fetch_row();
        if ($result->num_rows == 0) {
            echo "????<br>";
        } else {
            echo "<br>username rank<br>";
            echo $row[1] . " " . $row[2] . "<br>";
        }
    }
}
?>

<h1>Unkown Column Name Injection-Can you capture the flag?</h1>
<form method="post">
    <label>username</label><input type="text" name="username" />
    <input class="button" type="submit" name="submit" value="查询" />
</form>