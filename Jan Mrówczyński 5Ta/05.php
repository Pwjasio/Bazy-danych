<form action="05.php" method="post">
Wiersze: <select name="a">
<?php
for($a=1;$a<=100;$a++){
    echo("<option>$a</option>");
}
?>
</select>
Kolumny: <select name="b">
<?php
for($b=1;$b<=100;$b++){
    echo("<option>$b</option>");
};
?>
</select>
<input type="submit" value='ok'>
</form>
<?php
if(isset($_POST['a'])&&isset($_POST['b']))
    {
        $aa=$_POST['a'];
        $bb=$_POST['b'];
        echo('<table border=1>');
        for($a=1;$a<=$aa;$a++)
        {
            echo('<tr>');
            for($b=1;$b<=$bb;$b++)
            {
                echo("<td>$a"."_$b</td>");
            }
            echo("</tr>");
        }
        echo('</table>');
    }
?>