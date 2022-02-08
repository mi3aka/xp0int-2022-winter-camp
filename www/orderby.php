<?php
$hostip = "172.17.0.1"; //docker0 ip
$port = 5548;
$username = "user";
$password = "password";
$database = "orderby_injection";


$db = new mysqli($hostip, $username, $password, $database, $port);
if (mysqli_connect_errno()) { #检查连接
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if (isset($_POST['column'])) {
    $column = $_POST['column'];
    $query = "SELECT * FROM users ORDER BY $column;";
    $result = $db->query($query);
    if ($db->error) {
        echo "Error message: " . $db->error . "<br>";
    } else {
        $row = $result->fetch_all();
        if ($result->num_rows == 0) {
            echo "????<br>";
        } else {
            echo "<br>id username rank<br>";
            foreach ($row as $each_row) {
                foreach ($each_row as $data) {
                    echo $data . " ";
                }
                echo "<br>";
            }
        }
    }
}
?>

<h1>OrderBy Injection-Can you capture the flag?</h1>

<form method="post">
    <select name="column">
        <option value="id">id</option>
        <option value="username">username</option>
        <option value="rank">rank</option>
    </select>
    <input class="button" type="submit" value="提交" />
</form>