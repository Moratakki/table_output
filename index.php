<?php
include 'config.php';
include 'model/db_functions.php';
$pdo = connectToDB($DB_HOST, $DB_NAME, $DB_USER, $DB_PASS);
$column_names = getTableHead($pdo);
$doctors = getAllDoctors($pdo);
if (isset($_POST['doctorID'])) {
    $doctor = getDoctorById($pdo);
    include 'oneRowTable.html.php';
}
if (isset($_POST['deleteDoctor'])) {
    deleteDoctorByID($pdo);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style_output.css">
    <title>Document</title>
</head>

<body>

    <form action="" method="post">
        <div>
            <label for="doctorID">ID доктора:&nbsp;<input type="text" name="doctorID"></label>
        </div>
    </form>

    <table class="full_table">
        <thead>
            <?php foreach ($column_names as $val): ?>
                <th> <?php echo $val; ?></th>
            <?php endforeach; ?>
            <th>Удаление</th>
        </thead>
        <tbody>
            <?php foreach ($doctors as $doctor): ?>
                <tr>
                    <?php foreach ($doctor as $val): ?>
                        <td> <?php echo $val; ?></td>
                    <?php endforeach; ?>
                    <td>
                        <form action="" method="post" class="deleteForm">
                            <input class="deleteButton" type="submit" value="Удалить">
                            <input type="hidden" name="deleteDoctor" value="<?php echo $doctor['doctor_id'] ?>">
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

</body>

</html>