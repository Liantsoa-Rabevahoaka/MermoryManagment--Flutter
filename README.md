## Guide d'exécution du projet Flutter avec Firebase - Gestion de Soutenance

Ce guide explique comment exécuter le projet Gestion de Soutenance en utilisant Flutter et Firebase. Assurez-vous de suivre ces étapes pour configurer et exécuter le projet avec succès.

### Prérequis

- [Flutter](https://flutter.dev/docs/get-started/install) doit être installé sur votre machine.
- Un éditeur de code tel que Visual Studio Code ou Android Studio.
- Un compte Firebase pour configurer et gérer la base de données et l'authentification.

### Étapes

1. Téléchargez le projet depuis le dépôt Git ou obtenez le code source d'origine.

2. Ouvrez le projet dans votre éditeur de code préféré.

3. Configurez Firebase :
    SI VOUS VOULEZ CREER UN NOUVEAU PROJET
   - Créez un projet Firebase sur le [site Firebase](https://console.firebase.google.com/).
   - Ajoutez votre application Flutter au projet Firebase en suivant les étapes indiquées.
   - Téléchargez le fichier de configuration `google-services.json` pour Android ou `GoogleService-Info.plist` pour iOS.
   - Placez ce fichier dans le répertoire `android/app` pour Android et dans le dossier racine du projet pour iOS.

   SINON VOUS POUVEZ UTILISER LE PROJET EXISTANT
   - Avec ce compte qui a les informations suivantes : 
     - Email : 
     - Mot de passe : 

4. Exécutez la commande `flutter pub get` dans le terminal pour obtenir les dépendances nécessaires.

5. Assurez-vous d'avoir un émulateur ou un appareil physique prêt pour l'exécution. Vous pouvez utiliser Android Studio ou Visual Studio Code pour lancer l'application sur un émulateur ou un appareil.

6. Exécutez la commande `flutter run` dans le terminal à la racine du projet pour lancer l'application sur l'émulateur ou l'appareil connecté.

7. L'application devrait se lancer avec l'écran d'accueil "Bienvenue sur My defense!". Si vous utilisez l'émulateur, assurez-vous que l'émulateur dispose d'une connexion Internet pour interagir avec Firebase.

8. Vous pouvez explorer les différentes fonctionnalités de l'application, y compris les tutoriels, les avantages et les instructions d'utilisation.

### Informations d'identification

- Lors de la première exécution, vous devrez peut-être vous inscrire en tant qu'administrateur ou étudiant/jury selon vos besoins.
- Le compte administrateur a les informations suivantes :
  - Email : admin@gmail.com
  - Mot de passe : admin123
- Le compte étudiant a les informations suivantes :
  - Email : moi@gmail.com
  - Mot de passe : azerty
- Le compte jury a les informations suivantes :
  - Email : jury@gmail.com
  - Mot de passe : 123456

C'est tout ! Vous avez configuré et exécuté avec succès le projet de Gestion de Soutenance en utilisant Flutter et Firebase. Profitez de l'exploration des fonctionnalités de l'application.
