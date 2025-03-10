<?php
include '../model/db_functions.php';
deleteDoctorByID($pdo, $_POST['deleteDoctor']);
header("Location: ../index.php");