<?php
session_start(); // Start the session

// Include the database connection
include('db_connection.php');

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect and sanitize form data
    $donar_name = htmlspecialchars($_POST['donar_name'], ENT_QUOTES, 'UTF-8');
    $donar_contact = htmlspecialchars($_POST['donar_contact'], ENT_QUOTES, 'UTF-8');
    $donar_email = htmlspecialchars($_POST['donar_email'], ENT_QUOTES, 'UTF-8');
    $username = htmlspecialchars($_SESSION['username'] ?? 'Guest', ENT_QUOTES, 'UTF-8'); // Default to 'Guest' if not logged in
    
    $amount = floatval($_POST['amount']);
    $mode_of_payment = htmlspecialchars($_POST['mode_of_payment'], ENT_QUOTES, 'UTF-8');
    $date_of_transaction = date('Y-m-d'); // Use the current date

    // Insert donor details into `donar` table
    $stmt = $conn->prepare("INSERT INTO donar (donar_name, donar_contact, donar_email, username) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $donar_name, $donar_contact, $donar_email, $username);

    if ($stmt->execute()) {
        // Get the inserted `donar_id`
        $donar_id = $conn->insert_id;

        // Insert transaction details into `transaction` table
        $stmt = $conn->prepare("INSERT INTO transaction (donar_id, date_of_transaction, amount, mode_of_payment) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("isds", $donar_id, $date_of_transaction, $amount, $mode_of_payment);

        if ($stmt->execute()) {
            // Success message
            echo "<p>Thank you for your donation! Your transaction ID is " . $conn->insert_id . ".</p>";
            header("Location: donation_confirmation.php");
            exit();
        } else {
            echo "<p>Error recording transaction: " . $stmt->error . "</p>";
        }
    } else {
        echo "<p>Error recording donor details: " . $stmt->error . "</p>";
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Form</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Make a Donation</h1>
        <nav>
            <a href="adoption_home.html">Adopt</a>
            <a href="donation_home.html">Donate</a>
            <a href="DumnaWildlifeHome.html">Home</a>
        </nav>
    </header>
    
    <section class="form-section">
        <h2>Donation Details</h2>
        <form action="donation_form.php" method="post">
            <label for="donar_name">Full Name:</label>
            <input type="text" id="donar_name" name="donar_name" required>

            <label for="donar_contact">Contact Number:</label>
            <input type="text" id="donar_contact" name="donar_contact" required>

            <label for="donar_email">Email:</label>
            <input type="email" id="donar_email" name="donar_email" required>

            <label for="amount">Donation Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" required>

            <label for="mode_of_payment">Mode of Payment:</label>
            <select id="mode_of_payment" name="mode_of_payment" required>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="Net Banking">Net Banking</option>
                <option value="UPI">UPI</option>
                <option value="Cash">Cash</option>
            </select>

            <button type="submit">Donate</button>
        </form>
    </section>
    
    <footer>
        <p>&copy; 2024 Wildlife Sanctuary</p>
    </footer>
</body>
</html>
