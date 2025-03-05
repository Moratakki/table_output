<?php

function connectToDB($DB_HOST, $DB_NAME, $DB_USER, $DB_PASS)
{
    try {
        $pdo = new PDO(
            "mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4",
            $DB_USER,
            $DB_PASS,
            [
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8mb4'",
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_STRINGIFY_FETCHES => false
            ]
        );
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die('Невозможно подключиться к серверу баз данных: ' . $e->getMessage());
    }
}



function getAllDoctors($pdo)
{
    try {
        return $pdo->query('SELECT * FROM doctors', PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        die('Ошибка при извлечение всех докторов из таблицы: ' . $e->getMessage());
    }
}



function getTableHead($pdo)
{
    $columns = $pdo->query("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'hospital' AND TABLE_NAME = 'doctors'", PDO::FETCH_ASSOC);

    foreach ($columns as $row) {
        foreach ($row as $val) {
            $column_names[] = $val;
        }
    }

    return $column_names;
}



function getDoctorById($pdo)
{
    try {
        return $pdo->query("SELECT * FROM doctors WHERE doctor_id = " . $_POST['doctorID'], PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        die('Ошибка при извлечение доктора из таблицы по ID: ' . $e->getMessage());
    }
}



function deleteDoctorByID($pdo)
{
    try {
        $pdo->exec("DELETE FROM doctors WHERE doctor_id = " . $_POST['deleteDoctor']);
    } catch (PDOException $e) {
        die('Ошибка при удалении доктора из таблицы по ID: ' . $e->getMessage());
    }
    header("Location: .");
}