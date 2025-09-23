<?php
if(isset($_GET['id'])) echo $_GET['id'];
if(isset($_GET['b'])) echo $_GET['b'];
?>
<a href='04.php?id=<table border=1>
<?php
for($a=1;$a<=10;$a++){
    echo("<tr>");
            for($b=1;$b<=10;$b++){
                echo("<td>$a"."_$b</td>");
            };
    echo("</tr>");
};
?>
</table>'>10x10</a><br>
<a href='04.php?id=<table border=1>
<?php
for($a=1;$a<=5;$a++){
    echo("<tr>");
            for($b=1;$b<=5;$b++){
                echo("<td>$a"."_$b</td>");
            };
    echo("</tr>");
};
?>'>5x5</a><br>