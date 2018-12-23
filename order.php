<!DOCTYPE html>
<html>
<head>
<title>ORDER</title>
</head>
<body>
<table style='text-align:left;' border='1'>
<tr><th>custid</th><th>ordertime</th><th>pickuptime</th><th>cakename</th><th>pricepaid</th></tr>
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

    $name=$_POST['name'];
    $sql = mysqli_query($con, "select o.custid, o.ordertime, o.pickuptime, c.cakename, o.pricepaid 
                               from orders o join cake c on o.cakeid=c.cakeid 
                               where o.custid='$name'");
    $datarow = mysqli_num_rows($sql); 

    for($i=0;$i<$datarow;$i++)
    {
        $sql_arr = mysqli_fetch_assoc($sql);
        $custid = $sql_arr['custid'];
        $ordertime = $sql_arr['ordertime'];
        $pickuptime = $sql_arr['pickuptime'];
        $cakename = $sql_arr['cakename'];
        $pricepaid = $sql_arr['pricepaid'];
        echo "<tr><td>$custid</td><td>$ordertime</td><td>$pickuptime</td>
              <td>
              <a href='ingredient.php?cakename=$cakename'>$cakename</a>
              </td>
              <td>$pricepaid</td></tr>";
    }
    ?>
</table>
</body>
</html>
