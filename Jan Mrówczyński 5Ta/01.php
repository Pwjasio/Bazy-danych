<form name="01.php" action="post">
<select name="nazwa">
<?php
    for($a=1;$a<=1000;$a++){
        if($a==5)
        echo("<option selected>text$a</option>");
        else
        echo("<option>text$a</option>");
    }
?>
</select>
<input type='submit'>
</form>