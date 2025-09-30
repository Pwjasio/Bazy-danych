<?php
$conn = mysqli_connect("127.0.0.1", "root", "", "cw01");
if(isset($_POST["imie"])&&isset($_POST["nazwisko"]))
{
$sql = "INSERT INTO autorzy (imie, nazwisko) VALUES ('".$_POST["imie"]."','".$_POST["nazwisko"]."')";
mysqli_query($conn, $sql);
}
$sql = "SELECT * FROM autorzy";
$result = mysqli_query($conn, $sql);
if(mysqli_num_rows($result)>0){
    echo "<table border=1>";
    echo '<tr><td>aid</td><td>imie</td><td>nazwisko</td></tr>';
    while($row=mysqli_fetch_assoc($result)){
        echo"<tr>";
        echo"<td>".$row["aid"]."</td>";
        echo"<td>".$row["imie"]."</td>";
        echo"<td>".$row["nazwisko"]."</td>";
        echo"</tr>";
    }
    echo '</table>';
}else{
    echo '0 results';
}
?>
<FORM ACTION=22.php METHOD=POST>
imie: <INPUT TYPE=TEXT NAME=imie><BR>
nazwisko: <INPUT TYPE=TEXT NAME=nazwisko><BR>
<INPUT TYPE=SUBMIT value="ZAPISZ">
</FORM>
<?php
mysqli_close($conn);
?>