# PhoneStock #

Code source de l'application PhoneStock, développé dans le cadre d'un test technique pour l'agence Vertuoz

### Prérequis ###

`npm`, `composer`, `symfony-cli`, `php`.

### Installation ###

Clonez ce repository.  

Exécutez successivement les commandes `npm install` & `npm run dev`

Il y a un dump de la base de donnée `dbDump.sql`  
Veillez à appliquer ce dump sur une base de donnée de votre choix, ainsi que créer un utilisateur pour cette base.  
Vous pourrez après créer un fichier `.env.dev.local` et y paramétrer la connexion à la bdd (un modèle est disponible dans le `.env`)  

Ce après quoi vous pourrez lancer le serveur de développement : `symfony server:start`
