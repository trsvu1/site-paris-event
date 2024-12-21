MOCODO CODE

UTILISATEUR: id_utilisateur, nom, prénom, email, mot_de_passe, role, date_inscription
VISITE_VIRTUELLE, 0N CLIENT, 1N STAND
STAND: id_stand, id_hall, numero_stand, surface, prix
ASSOCIER1, 0N STAND, 1N HALL
HALL: id_hall, nom_hall, localisation, description, capacite_totale

ADMINISTRER, 0N UTILISATEUR, 1N CLIENT
CLIENT: id_client, id_utilisateur, nom_client, email_client
RESERVE, 0N CLIENT, 1N RESERVATION
RESERVER, 0N RESERVATION, 1N STAND
COMPOSER, 0N [composée] CATALOGUE, 0N [composante] CATALOGUE: quantité

FACTURE: id_facture, id_reservation, montant_total, date_facture, statut_facture
FACTURER, 1N RESERVATION, 0N FACTURE
RESERVATION: id_reservation, id_client, date_reservation, statut
ASSOCIER, 0N CATALOGUE, 1N RESERVATION
CATALOGUE: id_article, nom_article, type_article, prix_unitaire
