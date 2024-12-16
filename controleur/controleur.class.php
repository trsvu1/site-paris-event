<?php
    require_once ("modele/modele.class.php");
    class Controleur {
        private $unModele ;

        public function __construct(){
            //instancier la classe modele
            $this->unModele= new Modele ();
        }
        /**********Gestion des clients *************/
        public function insertClient($tab){
            //controler les donnees avant de les insertion dans la BDD

            //appel au modele pour inserer les données
            $this->unModele->insertClient($tab);
        }
    }
?>
