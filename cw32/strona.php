<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="kwerendy.txt">kwerendy</a>
    <a href="import.jpeg">import</a>
    <a href="kw1.jpeg">kw1</a>
    <a href="kw2.jpeg">kw2</a>
    <a href="kw3.jpeg">kw3</a>
    <a href="kw4.jpeg">kw4</a><br><br>
    Wpisz nazwe miasta: <input type="text"> <button name="SZUKAJ KWIACIARNI">SZUKAJ KWIACIARNI</button>
<?php
$conn = mysqli_connect('localhost', 'root', '', 'cw32');
$sql = "SELECT nazwa, miasto, ulica FROM `kwiaciarnie`;";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result)>0){
    echo '<table>';
    echo '<tr><td></td><td></td><td></td></tr>';
    while($row=mysqli_fetch_assoc($result)){
        echo '<tr>';
        echo '<td>' .'<b>' . $row['nazwa'] . '</b>' . '</td>'. '<br>';
        echo '<td>'. $row['miasto'] . '</td>';
        echo '<td>'.'ulica: '. $row['ulica'] . '</td>';
        echo '</tr>';
    };
    echo '</table>';
};
?>
<?php
mysqli_close($conn);
?>
</body>
</html>