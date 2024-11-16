<?php
session_start(); // Start the session

// Include database connection
include('db_connection.php');

// Fetch animals from the database dynamically
$animal_options = '';
$sql = "SELECT animal_id, animal.name FROM animal"; // Replace with your actual table and column names
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $animal_id = $row['animal_id'];
        $animal_name = htmlspecialchars($row['name'], ENT_QUOTES, 'UTF-8'); // Escape special characters
        $animal_options .= "<option value=\"$animal_id\">$animal_name</option>";
    }
} else {
    $animal_options = '<option value="">No animals available</option>';
}

// Close the database connection
$conn->close();

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Store personal details in session
    $_SESSION['name'] = htmlspecialchars($_POST['name'], ENT_QUOTES, 'UTF-8');
    $_SESSION['email'] = htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8');
    $_SESSION['contact'] = htmlspecialchars($_POST['contact'], ENT_QUOTES, 'UTF-8');
    $_SESSION['animal_id'] = intval($_POST['animal_id']); // Convert to integer for safety

    // Redirect to the second page for adoption transaction details
    header("Location: adoption_transaction.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoption Form - Personal Details</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Adoption Application - Personal Details</h1>
        <nav>
            <a href="adoption_home.html">Adopt</a>
            <a href="donation_home.html">Donate</a>
            <a href="DumnaWildlifeHome.html">Home</a>
        </nav>
    </header>
    
    <section class="form-section">
        <h2>Apply to Adopt an Animal</h2>
        <form action="adoption_form.php" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="contact">Contact Number:</label>
            <input type="text" id="contact" name="contact" required>
            
            <label for="animal">Select Animal:</label>
            <select id="animal" name="animal_id" required>
                <?= $animal_options ?> <!-- Dynamically insert options here -->
            </select>
            
            <label for="reason">Reason for Adoption:</label>
            <textarea id="reason" name="reason" rows="4"></textarea>
            
            <button type="submit">Next</button>
        </form>
    </section>
    
    <footer>
        <p>&copy; 2024 Wildlife Sanctuary</p>
    </footer>
</body>
</html>
