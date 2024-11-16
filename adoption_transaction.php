<?php
session_start(); // Start the session

// Check if the session has the personal details
if (!isset($_SESSION['name'])) {
    // If personal details are not available in the session, redirect to the first page
    header("Location: adoption_form.php");
    exit();
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect transaction details from the form
    $amount_for_adoption = floatval($_POST['amount_for_adoption']);
    $mode_of_transaction = htmlspecialchars($_POST['mode_of_transaction'], ENT_QUOTES, 'UTF-8');
    $transaction_id = "TXN" . rand(1000, 9999); // Generate random transaction ID
    $username = htmlspecialchars($_SESSION['username'] ?? 'guest', ENT_QUOTES, 'UTF-8'); // Get username from session or set as 'guest'

    // Correctly assign the current date
    $adoption_date = date("Y-m-d"); // Ensure it returns a valid date

    // Get personal details from session
    $name = htmlspecialchars($_SESSION['name'], ENT_QUOTES, 'UTF-8');
    $email = htmlspecialchars($_SESSION['email'], ENT_QUOTES, 'UTF-8');
    $contact = htmlspecialchars($_SESSION['contact'], ENT_QUOTES, 'UTF-8');
    $animal_id = intval($_SESSION['animal_id']); // Ensure it's an integer

    // Clear session data after use
    session_unset();

    // Include the database connection
    include('db_connection.php');

    // Prepare the SQL query
    $sql = "INSERT INTO adopter (adopter.name, email, phone_no, adoption_date, amount_for_adoption, mode_of_transaction, transaction_id, animal_id) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    // Prepare the statement
    if ($stmt = $conn->prepare($sql)) {
        // Bind parameters
        $stmt->bind_param("ssssdsis", $name, $email, $contact, $adoption_date, $amount_for_adoption, $mode_of_transaction, $transaction_id, $animal_id);

        // Debugging - Check if the prepared statement is ready
        echo "Executing query...<br>";

        // Execute query
        if ($stmt->execute()) {
            echo "<p>Thank you for adopting! Your adoption request has been successfully submitted.</p>";
            // Redirect to confirmation page
            header("Location: adoption_confirmation.php");
            exit();
        } else {
            echo "<p>Error: Could not process your adoption. SQL Error: " . htmlspecialchars($stmt->error) . "</p>";
        }
    } else {
        echo "<p>Error: Could not prepare the query. Error: " . htmlspecialchars($conn->error) . "</p>";
    }


    // Close the connection
    $stmt->close();
    $conn->close();
}
?>


<!-- adoption-form.html -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoption Form</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <header>
        <h1>Adoption Application - Transaction Details</h1>
        <nav>
            <a href="adoption_home.html">Adopt</a>
            <a href="donation_home.html">Donate</a>
            <a href="DumnaWildlifeHome.html">Home</a>
        </nav>
    </header>

    <section class="form-section">
        <h2>Apply to Adopt an Animal</h2>
        <form action="adoption_transaction.php" method="POST">
            <label for="amount_for_adoption">Amount for Adoption:</label>
            <input type="number" id="amount_for_adoption" name="amount_for_adoption" required>

            <label for="mode_of_transaction">Mode of Transaction:</label>
            <select id="mode_of_transaction" name="mode_of_transaction" required>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Bank Transfer">Bank Transfer</option>
            </select>

            <button type="submit">Submit Adoption</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Wildlife Sanctuary</p>
    </footer>
</body>

</html>