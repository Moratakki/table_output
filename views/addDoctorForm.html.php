<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавление доктора</title>
    <link rel="stylesheet" href="../css/style_output.css">
</head>

<body>
    <div>
        <form class="addDoctor" action="../controllers/addDoctorController.php" method="POST">
            <div>
                <label for="firstname">Имя: </label><input type="text" name="firstname">
            </div>
            <div>
                <label for="lastname">Фамилия: </label><input type="text" name="lastname">
            </div>
            <div>
                <label for="specialty">Специальность: </label><input type="text" name="specialty">
            </div>
            <div>
                <input type="submit" value="Добавить">
            </div>
        </form>
    </div>
</body>

</html>