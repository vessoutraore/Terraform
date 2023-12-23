# Terraform
Terraform avec AWS & GCP HandsOn Labs. Infrastructure as a Code, Terraform Associate Certification avec un seul cours

## Installer Terraform sur MacOS / Windows
### Installer Terraform sur Mac Machine -

Pour installer Terraform sur un ordinateur MAC, il suffit de copier-coller le script ci-dessous dans votre ordinateur local et de l'exécuter. Vous pouvez également exécuter les commandes données dans le script une par une, mais l'exécution complète du script est préférable à l'exécution d'une seule ligne de commande.

**mac-terraform-install.sh**

1. brew install jq
1. brew install wget
1. cd~
1. version=$(curl https://api.github.com/repos/hashicorp/terraform/releases/latest --silent | jq ".tag_name" -r)
1. version=$(echo $version | sed 's/v//g') # get rid of 'v' from version number
1. echo "Installing Terraform $version."
1. url="https://releases.hashicorp.com/terraform/$version/terraform_$(echo $version)_darwin_amd64.zip"
1. wget $url
1. unzip "terraform_$(echo $version)_darwin_amd64.zip"
1. chmod +x terraform
1. sudo mv terraform /usr/local/bin/
1. echo "Terraform $version installed."
1. rm "terraform_$(echo $version)_darwin_amd64.zip"
1. echo "Install files cleaned up."

### Installer Terraform sur Windows 10 -

1. Téléchargez la version appropriée de Terraform à partir de la  [page de téléchargement de HashiCorp](https://developer.hashicorp.com/terraform/install). Dans mon cas, il s'agit de la version Windows 64 bits.

1. Créez un dossier sur votre lecteur C:\Noù vous pourrez placer l'exécutable Terraform. Je préfère placer les programmes d'installation dans un sous-dossier (par exemple, C:\tools) où vous pouvez placer les binaires.

1. Une fois le téléchargement terminé, allez le chercher dans l'Explorateur de fichiers. Extrayez le fichier zip dans le dossier que vous avez créé à l'étape 2.

1. Ouvrez votre menu Démarrer et tapez "environnement". La première chose qui apparaît devrait être l'option Editer les variables d'environnement du système. Cliquez sur cette option et vous devriez voir cette fenêtre.
   
   <img width="307" alt="environnement" src="https://github.com/vessoutraore/Terraform/assets/126578500/4de690f8-9e1b-4717-b1f9-d8765b4eb0bc">

1. Cliquez sur Variables d'environnement... en bas et vous verrez ceci

<img width="446" alt="variableenv" src="https://github.com/vessoutraore/Terraform/assets/126578500/6bc11dcf-d72c-402f-a8f6-039a4cc30b0d">

1. Dans la section inférieure où il est question de variables système, trouvez une variable appelée Chemin **path** et cliquez sur Modifier. Vous verrez alors une liste d'endroits où trouver les binaires dont Windows peut avoir besoin pour une raison ou une autre.

1. Cliquez sur Nouveau et ajoutez le chemin du dossier où se trouve terraform.exe au bas de la liste. Cela devrait ressembler à ceci lorsque vous aurez terminé.

<img width="413" alt="path" src="https://github.com/vessoutraore/Terraform/assets/126578500/9b1d3bd0-abed-4eb3-b74e-4dbb88835057">

1.  Cliquez sur OK dans chacun des menus que vous avez ouverts jusqu'à ce qu'il n'y en ait plus.

1. Vérifiez que l'installation a réussi en entrant terraform --version. S'il renvoie une version, vous êtes prêt à partir

   <img width="674" alt="terraformversion" src="https://github.com/vessoutraore/Terraform/assets/126578500/a7991de2-6014-47b6-aae1-7ce221cbaeb4">



   

