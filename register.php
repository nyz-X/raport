<?php
require 'config/connection.php';
$message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama     = $_POST['nama'];
    $username = $_POST['username'] ?? null;
    $nip      = $_POST['nip'] ?? null;
    $nis      = $_POST['nis'] ?? null;
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $access   = $_POST['access'];

    $is_valid = true;

    // Validasi untuk admin
    if ($access == '1') {
        if (empty($username)) {
            $message = "Username wajib diisi untuk admin.";
            $is_valid = false;
        }
        $nip = null;
        $nis = null;
    }

    // Validasi untuk guru
    if ($access == '2') {
        $username = null;
        $nis = null;

        if (empty($nip)) {
            $message = "NIP wajib diisi untuk guru.";
            $is_valid = false;
        } else {
            $check_nip = $conn->prepare("SELECT nip FROM guru WHERE nip = ?");
            $check_nip->bind_param("s", $nip);
            $check_nip->execute();
            $check_nip->store_result();
            if ($check_nip->num_rows == 0) {
                $message = "Gagal mendaftar: NIP tidak ditemukan di data guru.";
                $is_valid = false;
            }
            $check_nip->close();
        }
    }

    // Validasi untuk siswa
    if ($access == '3') {
        $username = null;
        $nip = null;

        if (empty($nis)) {
            $message = "NIS wajib diisi untuk siswa.";
            $is_valid = false;
        } else {
            $check_nis = $conn->prepare("SELECT nis FROM siswa WHERE nis = ?");
            $check_nis->bind_param("s", $nis);
            $check_nis->execute();
            $check_nis->store_result();
            if ($check_nis->num_rows == 0) {
                $message = "Gagal mendaftar: NIS tidak ditemukan di data siswa.";
                $is_valid = false;
            }
            $check_nis->close();
        }
    }

    if ($is_valid) {
        $stmt = $conn->prepare("
            INSERT INTO users (nama, username, password, id_access, nip, nis)
            VALUES (?, ?, ?, ?, ?, ?)
        ");
        $stmt->bind_param("ssssss", $nama, $username, $password, $access, $nip, $nis);

        if ($stmt->execute()) {
            $message = "Akun berhasil dibuat. Silakan login.";
        } else {
            $message = "Gagal mendaftar: " . htmlspecialchars($stmt->error);
        }

        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Registrasi</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="icon" href="assets/img/3330314.png" type="image/x-icon">
    <style>
        body {
            background-color: #f1f3f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .card-register {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border-radius: 15px;
            background-color: white;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .text-muted {
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="card-register">
    <?php if ($message): ?>
        <div class="alert alert-info text-center"><?= $message ?></div>
    <?php endif; ?>

    <form method="POST" id="registerForm">
        <div class="text-center mb-4">
            <img src="assets/img/3330314.png" width="60" alt="Logo Buku">
        </div>
        <h5 class="text-center mb-4">Daftar Akun Baru</h5>

        <div class="mb-3">
            <input type="text" class="form-control" name="nama" placeholder="Nama Lengkap" required>
        </div>

        <div class="mb-3 d-none" id="usernameField">
            <input type="text" class="form-control" name="username" placeholder="Username Admin">
        </div>

        <div class="mb-3 d-none" id="nipField">
            <input type="text" class="form-control" name="nip" placeholder="NIP Guru">
        </div>

        <div class="mb-3 d-none" id="nisField">
            <input type="text" class="form-control" name="nis" placeholder="NIS Siswa">
        </div>

        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>

        <div class="mb-3">
            <select class="form-select" name="access" id="access" required onchange="toggleInputs()">
                <option value="" disabled selected>-- Pilih Akses --</option>
                <?php
                $akses = $conn->query("SELECT * FROM access");
                while ($row = $akses->fetch_assoc()) {
                    echo "<option value='{$row['id_access']}'>{$row['role']}</option>";
                }
                ?>
            </select>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-check-circle"></i> Daftar
            </button>
        </div>

        <div class="text-center mt-3">
            <a href="index.php" class="text-muted">Sudah punya akun? Login</a>
        </div>
    </form>
</div>

<script>
function toggleInputs() {
    const role = document.getElementById('access').value;
    document.getElementById('usernameField').classList.add('d-none');
    document.getElementById('nipField').classList.add('d-none');
    document.getElementById('nisField').classList.add('d-none');

    if (role === '1') {
        document.getElementById('usernameField').classList.remove('d-none');
    } else if (role === '2') {
        document.getElementById('nipField').classList.remove('d-none');
    } else if (role === '3') {
        document.getElementById('nisField').classList.remove('d-none');
    }
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
