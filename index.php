<?php
include 'model/db_functions.php';
$column_names = getTableHead($pdo);
$doctors = getAllDoctors($pdo);
if (isset($_POST['doctorID'])) {
    $doctor = getDoctorById($pdo);
    include 'templates/oneRowTable.html.php';
}
?>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style_output.css">
    <title>Список докторов</title>
</head>

<body>

    <div>
        <a href="views/addDoctorForm.html.php">Добавить доктора</a>
    </div>

    <div>
        <form action="" method="post">
            <label for="doctorID">ID доктора:&nbsp;<input type="text" name="doctorID"></label>
        </form>
    </div>

    <div>
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
                            <form action="controllers/deleteDoctorByIDController.php" method="post" class="deleteForm">
                                <input class="deleteButton" type="submit" value="Удалить">
                                <input type="hidden" name="deleteDoctor" value="<?php echo $doctor['doctor_id'] ?>">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</body>

</html>