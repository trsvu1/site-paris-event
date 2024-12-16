drop database if exists paris_event;
create database paris_event;
use paris_event;

-- création de la table utilisateur
create table Utilisateur (
    id_utilisateur int auto_increment primary key,  -- identifiant unique pour l'utilisateur
    nom varchar(255) not null,                      -- nom de l'utilisateur
    prenom varchar(255) not null,                   -- prénom de l'utilisateur
    email varchar(255) unique not null,             -- email unique pour l'authentification
    mot_de_passe varchar(255) not null,             -- mot de passe
    role enum('client', 'administrateur', 'commercial') not null,  -- role de l'utilisateur
    date_inscription timestamp default current_timestamp  -- date d'inscription
);

-- création de la table client
create table Client (
    id_client int primary key,                     -- identifiant unique du client
    id_utilisateur int not null,                   -- lien avec l'utilisateur
    adresse varchar(255),                          -- adresse du client
    telephone varchar(20),                         -- téléphone du client
    foreign key (id_utilisateur) references utilisateur(id_utilisateur) on delete cascade
);

-- création de la table hall
create table Hall (
    id_hall int auto_increment primary key,        -- identifiant unique du hall
    nom_hall varchar(255) not null,                 -- nom du hall
    localisation varchar(255),                      -- localisation du hall
    description text,                               -- description du hall
    capacite_totale int not null,                   -- capacité totale du hall
    plan_hall varchar(255)                         -- url ou chemin du plan du hall
);

-- création de la table stand
create table Stand (
    id_stand int auto_increment primary key,        -- identifiant unique du stand
    id_hall int not null,                           -- lien avec le hall
    numero_stand varchar(50) not null,              -- numéro du stand
    surface int,                                    -- surface du stand en m²
    disponibilite boolean default true,             -- disponibilité du stand
    prix decimal(10, 2),                            -- prix de location du stand
    foreign key (id_hall) references hall(id_hall) on delete cascade
);

-- création de la table reservation
create table Reservation (
    id_reservation int auto_increment primary key,  -- identifiant unique de la réservation
    id_client int not null,                         -- lien avec le client
    date_reservation timestamp default current_timestamp,  -- date de la réservation
    etat enum('en attente', 'confirmée', 'annulée') not null,  -- état de la réservation
    foreign key (id_client) references client(id_client) on delete cascade
);

create table Catalogue (
    id_article int primary key auto_increment,    -- identifiant unique de l'article
    nom_article varchar(255) not null,            -- nom de l'article
    description text,                             -- description de l'article
    type enum('mobilier', 'électrique', 'repas', 'autre') not null, -- type de service/produit
    prix_unitaire decimal(10, 2) not null,
    img_article varchar(255)  -- adresse relative de l'image de l'article
);

-- création de la table facture
create table Facture (
    id_facture int auto_increment primary key,      -- identifiant unique de la facture
    id_reservation int not null,                    -- lien avec la réservation
    montant_total decimal(10, 2) not null,          -- montant total de la facture
    date_facture timestamp default current_timestamp,  -- date de la facture
    etat enum('payée', 'en attente', 'annulée') not null,  -- état de la facture
    foreign key (id_reservation) references reservation(id_reservation) on delete cascade
);

-- création de la table echange
create table Echange (
    id_echange int auto_increment primary key,      -- identifiant unique de l'échange
    id_utilisateur int not null,                    -- lien avec l'utilisateur
    message text not null,                          -- contenu du message échangé
    date_message timestamp default current_timestamp,  -- date de l'échange
    foreign key (id_utilisateur) references utilisateur(id_utilisateur) on delete cascade
);