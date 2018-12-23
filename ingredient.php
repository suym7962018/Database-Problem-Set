<!DOCTYPE html>
<html>
<head>
<title>INGREDIENT</title>
</head>
<body>
<table style='text-align:left;' border='1'>
<tr><th>cakename</th><th>ingredient</th><th>amount</th></tr>
    <?php
    $server="localhost";
    $db_username="root";
    $db_password="root";
    $db_name="HW3";
    $con=mysqli_connect($server, $db_username, $db_password, $db_name);
    if(!$con)
    {
        die("can't connect".mysqli_error());
    }

    $cakename=$_GET['cakename'];   
    $sql = mysqli_query($con, "select c.cakename, i.iname,co.qty
                               from contain co join ingredient i on co.ingredid=i.ingredid
                               join cake c on co.cakeid=c.cakeid
                               where c.cakename='$cakename'");
    $datarow = mysqli_num_rows($sql); 

    for($i=0;$i<$datarow;$i++)
    {
        $sql_arr = mysqli_fetch_assoc($sql);
        $cakename = $sql_arr['cakename'];
        $ingredient = $sql_arr['iname'];
        $amount = $sql_arr['qty'];
        echo "<tr><td>$cakename</td><td>$ingredient</td><td>$amount</td></tr>";
    }
    ?>
</table>
</body>
</html>
