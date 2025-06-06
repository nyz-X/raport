<?php
require 'config/connection.php';
session_start();
$message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $input    = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("
        SELECT * FROM users 
        WHERE (username = ?)
        LIMIT 1
    ");
    $stmt->bind_param("s", $input);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        if (password_verify($password, $user['password'])) {
            $_SESSION['user'] = $user;

            switch ($user['id_access']) {
                case 1: header("Location: dashboard/admin/index.php"); break;
                default:
                    $message = "Role tidak valid.";
                    session_destroy();
            }
            exit;
        } else {
            $message = "Password salah!";
        }
    } else {
        $message = "Data tidak ditemukan!";
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="assets/img/3330314.png" type="image/x-icon">
    <style>
        body {
            background-color: #f1f2f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: #fff;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-box img {
            display: block;
            margin: 0 auto 1rem;
            width: 60px;
        }
        .login-box h4 {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }
        .form-check-label {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="login-box">
    <img src="assets/img/3330314.png" width="50">
    <h4>Please login</h4>
    
    <?php if ($message): ?>
        <div class="text-danger text-center mb-3"><?= $message ?></div>
    <?php endif; ?>

    <form method="POST">
        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Username" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>
        <div class="form-check mb-3">
            <input type="checkbox" class="form-check-input" id="rememberMe">
            <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Login</button><br>
        </div>
        <div class="text-center mt-3">
            <a href="register.php" class="text-muted">Belum punya akun? Daftar</a>
        </div>
    </form>
</div>

</body>
</html>
