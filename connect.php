<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "manifestlink";
$db_port = 3307;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $db_port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}