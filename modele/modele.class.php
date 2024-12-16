<?php
    class Modele {
        private $unPdo ; 
        //connexion via la classe PDO : PHP DATA Object

        public function __construct(){
            $serveur = "localhost";
            $bdd ="paris_event";
            $user = "root";
            $mdp = "root";

            try{
            $this->unPdo = new PDO("mysql:host=".$serveur.";dbname=".$bdd,$user,$mdp);
            }
            catch(PDOException $exp){
                echo "Erreur de connexion à la base de données : ";
            }
        }
        /***************Gestion des clients */
        public function insertClient($tab){
            $requete = "insert into client values(null, :nom, :prenom, :adresse, :email, :tel)";
            $donnees = array(':nom' => $tab['nom'],
                            ':prenom' => $tab['prenom'],
                            ':adresse' => $tab['adresse'],
                            ':email' => $tab['email'],
                            ':tel' => $tab['telephone']
                            );
            //on prepare la requete
            $exec = $this->unPdo->prepare ($requete);
            //exécuter la requete
            $exec->execute ($donnees);
        }
    }

?>