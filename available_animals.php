<?php
// Include the database connection
include('db_connection.php');

// Fetch animals from the database
$animals = [];
$sql = "SELECT animal_id, animal.name, age, species_type, health_status FROM animal"; // Replace with your table and column names
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $animals[] = $row;
    }
} else {
    $animals = []; // No animals available
}

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Animals for Adoption</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Available Animals for Adoption</h1>
        <nav>
            <a href="adoption_home.html">Adopt</a>
            <a href="donation_home.html">Donate</a>
            <a href="DumnaWildlifeHome.html">Home</a>
        </nav>
    </header>
    
    <section class="animal-list">
        <h2>Meet Our Animals</h2>
        <?php if (!empty($animals)): ?>
            <?php foreach ($animals as $animal): ?>
                <div class="animal">
                    <!-- <img src="<?= htmlspecialchars($animal['image_path']) ?>" alt="<?= htmlspecialchars($animal['animal.name']) ?>"> -->
                    <h3><?= htmlspecialchars($animal['name']) ?></h3>
                    <p>Age: <?= htmlspecialchars($animal['age']) ?> years | Species: <?= htmlspecialchars($animal['species_type']) ?> | Health Status: <?= htmlspecialchars($animal['health_status']) ?></p>
                    <a href="adoption_form.php?animal_id=<?= htmlspecialchars($animal['animal_id']) ?>" class="button">Adopt Me</a>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No animals available for adoption at the moment. Please check back later.</p>
        <?php endif; ?>
    </section>
    
    <footer>
        <p>&copy; 2024 Wildlife Sanctuary</p>
    </footer>
</body>
</html>
