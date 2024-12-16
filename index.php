<?php
    require_once("controleur/controleur.class.php");
    //instancier la classe controleur :
    $unControleur = new Controleur();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <title>Paris Events</title>
</head>
<body>
    <div id="header"></div>
    <script>
    fetch('vue/header/header.php')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header').innerHTML = data;
        });
    </script>

    <center>
        <?php
            if (isset($_GET['page'])){
                $page = $_GET['page'];
            }else {
                $page = "home" ;
            }
            switch ($page) {
                case "home" : require_once ("vue/home/home.php"); break;
                case "connexion" : require_once ("vue/connexion/connexion.php"); break;
                case "inscription" : require_once ("vue/inscription/inscription.php"); break;
                case "reservation" : require_once ("vue/reservation/reservation.php"); break;
                case "panier" : require_once ("vue/panier/panier.php"); break;
            }
        ?>
    </center>


    <div id="footer"></div>
    <script>
    fetch('vue/footer/footer.php')
        .then(response => response.text())
        .then(data => {
            document.getElementById('footer').innerHTML = data;
        });
    </script>

</body>
</html>