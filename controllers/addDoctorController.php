<?php
include '../model/db_functions.php';
addDoctor($pdo, $_POST['firstname'], $_POST['lastname'], $_POST['specialty']);
header("Location: ../index.php");
