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

<img width="446" alt="variableenv" src="https://github.com/vessoutraore/Terraform/assets/126578500/2603b146-f9b7-480e-8816-c55c184fa6b4">

1. Dans la section inférieure où il est question de variables système, trouvez une variable appelée Chemin **path** et cliquez sur Modifier. Vous verrez alors une liste d'endroits où trouver les binaires dont Windows peut avoir besoin pour une raison ou une autre.

1. Cliquez sur Nouveau et ajoutez le chemin du dossier où se trouve terraform.exe au bas de la liste. Cela devrait ressembler à ceci lorsque vous aurez terminé.

<img width="413" alt="path" src="https://github.com/vessoutraore/Terraform/assets/126578500/9b1d3bd0-abed-4eb3-b74e-4dbb88835057">

1.  Cliquez sur OK dans chacun des menus que vous avez ouverts jusqu'à ce qu'il n'y en ait plus.

1. Vérifiez que l'installation a réussi en entrant terraform --version. S'il renvoie une version, vous êtes prêt à partir

   <img width="674" alt="terraformversion" src="https://github.com/vessoutraore/Terraform/assets/126578500/a7991de2-6014-47b6-aae1-7ce221cbaeb4">

@vessoutraore :+1: :smiling_face_with_three_hearts: Looks great - it's ready to go ! :shipit:


## Commence par les bases de terraform

Admettez que vous avez déjà le fichier main.tf dont l'explication du contenu est le suivant: 

Le code fourni est écrit en langage HashiCorp Configuration Language (HCL) et est utilisé pour définir la configuration des fournisseurs (providers) dans Terraform. Les fournisseurs sont des plugins qui permettent à Terraform d'interagir avec différentes API de services cloud ou d'autres types d'infrastructures.

Voici une explication ligne par ligne :

1. **Configurer le fournisseur AWS :**
   ```hcl
   provider "aws" {
       version = "3.53.0"
       region  = "us-east-1"
   }
   ```
   - `provider "aws"` : Cela indique à Terraform que vous configurez un fournisseur AWS.
   - `version = "3.53.0"` : Spécifie la version du plugin AWS à utiliser. Dans cet exemple, la version 3.53.0 est utilisée.
   - `region = "us-east-1"` : Indique la région AWS à utiliser pour les ressources créées. Ici, c'est "us-east-1" (Virginie du Nord).

2. **Configurer le fournisseur Microsoft Azure :**
   ```hcl
   provider "azurerm" {
       version = "2.72.0"
       features {}
   }
   ```
   - `provider "azurerm"` : Cela indique à Terraform que vous configurez un fournisseur Azure.
   - `version = "2.72.0"` : Spécifie la version du plugin Azure à utiliser. Dans cet exemple, la version 2.72.0 est utilisée.
   - `features {}` : Cette section permet de spécifier des fonctionnalités spécifiques du fournisseur Azure. Dans cet exemple, elle est laissée vide, ce qui signifie qu'aucune fonctionnalité spécifique n'est activée.

NB : AWS et Azure. Ces fournisseurs seront utilisés pour créer, modifier et gérer des ressources dans les environnements AWS et Azure respectivement, lors de l'exécution des scripts Terraform associés.
   
3. Pour ce faire, je vais créer un répertoire nommé 'providers', y inclure un fichier 'main.tf' et y insérer le code mentionné ci-dessous.

<img width="899" alt="code" src="https://github.com/vessoutraore/Terraform/assets/126578500/25641c20-adcf-4295-b5e9-f6d69dfb4dbc">

<img width="761" alt="providerscode" src="https://github.com/vessoutraore/Terraform/assets/126578500/3bc4cfc3-ac59-4d15-b780-7f6705543370">

4. Ensuite tu exécute cette commande : **$ export TF_LOG="TRACE"**
6. Ensuite l'initialiser le repertoire de travail de terraform en utilisant la comme : **$ terraform init**


## Configuration d'AWS pour terraform 

### Création d'un utilisateur IAM (console)
1. Connectez-vous à votre compte AWS
2. Sur la page d'accueil de la console, sélectionnez le service IAM.
3. Dans le volet de navigation, sélectionnez Utilisateurs,

<img width="964" alt="Utilisateur" src="https://github.com/vessoutraore/Terraform/assets/126578500/47c63e54-80a3-4265-8781-8f012f3c484f">

puis créer un utilisateur.

<img width="917" alt="createuser" src="https://github.com/vessoutraore/Terraform/assets/126578500/9d4889d2-2b1b-4084-b448-0b9f15f9a1d1">

5. Sur la page Spécifier les détails de l'utilisateur, sous Détails de l'utilisateur, dans Nom d'utilisateur, entrez le nom du nouvel utilisateur. Il s'agit de son nom de connexion pour AWS.

**Note:** Sélectionnez **Fournir aux utilisateurs l'accès à la console de gestion AWS facultatif** Cela génère des informations d'identification de AWS Management Console pour le nouvel utilisateur.

sélectionnez Je souhaite créer un utilisateur IAM et poursuivez cette procédure.

Pour Mot de passe de la console, sélectionnez l'une des options suivantes :

Mot de passe généré automatiquement – L'utilisateur obtient un mot de passe généré de façon aléatoire qui correspond à la politique de mot de passe de compte. Vous pouvez afficher ou télécharger le mot de passe lorsque vous accédez à la page Récupérer le mot de passe.

Mot de passe personnalisé – L'utilisateur se voit attribuer le mot de passe que vous entrez dans la zone.

(Facultatif) L'option Les utilisateurs doivent créer un nouveau mot de passe à leur prochaine connexion (recommandée) est sélectionnée par défaut afin d'obliger l'utilisateur à changer son mot de passe lors de sa première connexion

<img width="885" alt="ProgramGroup" src="https://github.com/vessoutraore/Terraform/assets/126578500/e751e6b9-e3f5-403d-99ce-dc615aa28d4b">

6. Sélectionnez Suivant.
7. Création de groupe

<img width="629" alt="creategroup" src="https://github.com/vessoutraore/Terraform/assets/126578500/4b727700-4b2d-4025-83c9-2008b8c041e0">

Puis donnez lui une autorisation comme suit :

<img width="612" alt="TerraformAcces" src="https://github.com/vessoutraore/Terraform/assets/126578500/0fb1410c-8123-4a87-beea-3ffc0687e5a7">

8. Enfin cliquez sur créer un utilisateur en télécharger vos informations ou à défaut envoyez les informations par email.

<img width="636" alt="télécharger" src="https://github.com/vessoutraore/Terraform/assets/126578500/1102fa8e-f2f5-4660-860e-284c025ae03b">

### Configuration des règles entrantes pour le trafic entrant qui est autorisé à atteindre l'instance.

1. Dans VPC puis groupe de sécurité
<img width="586" alt="GroupSecurity" src="https://github.com/vessoutraore/Terraform/assets/126578500/64d45d7e-116e-4f86-906b-e233f6884e7d">

<img width="749" alt="R1" src="https://github.com/vessoutraore/Terraform/assets/126578500/a4ca5d63-2d26-46d3-b66e-c73db8d695ad">

2. Ajoutez 'Tout trafic' et votre adresse ip

<img width="923" alt="Touttrafic" src="https://github.com/vessoutraore/Terraform/assets/126578500/c31b5993-3cbc-48b2-9ded-f32d65755999">

3. Enfin cliquez enregistrer les règles.

## Création d'une machine à l'aide de terraform

Pour Ce faire vous allez utiliser ce code Terraform pour configurer un fournisseur AWS et crée une instance EC2 dans la région "us-east-1" en utilisant une AMI spécifique et un type d'instance "t2.micro". voici l'explication claire du code :

1. **Configurer le fournisseur AWS :**
   ```hcl
   provider "aws" {
       version    = "3.53.0"
       access_key = "ACCESS KEY"
       secret_key = "SECRET_KEY"
       region     = "us-east-1"
   }
   ```
   - `provider "aws"` : Indique que vous configurez un fournisseur AWS.
   - `version = "3.53.0"` : Spécifie la version du plugin AWS à utiliser.
   - `access_key` et `secret_key` : Ces champs contiennent les clés d'accès (access key) et secrètes (secret key) permettant à Terraform d'authentifier votre accès à AWS. Notez que stocker les clés de cette manière n'est généralement pas recommandé pour des raisons de sécurité.
   - `region = "us-east-1"` : Indique la région AWS dans laquelle les ressources seront créées.

2. **Créer une instance EC2 :**
   ```hcl
   resource "aws_instance" "MyFirstInstnace" {
     ami           = "ami-0b0ea68c435eb488d"
     instance_type = "t2.micro"
   }
   ```
   - `resource "aws_instance" "MyFirstInstnace"` : Définit une ressource AWS de type "aws_instance" avec le nom logique "MyFirstInstnace". Cela permet de référencer cette instance dans d'autres parties du code Terraform.
   - `ami = "ami-0b0ea68c435eb488d"` : Spécifie l'AMI (Amazon Machine Image) à utiliser pour l'instance. Dans cet exemple, il s'agit d'une AMI spécifique.
   - `instance_type = "t2.micro"` : Indique le type d'instance EC2 à créer, ici une instance de type "t2.micro". C'est un type d'instance de faible capacité destiné à un usage léger.

pour l'ami, vous pouvez consulter le lien suivant : https://cloud-images.ubuntu.com/locator/ec2/

3. **Création d'une clé d'accès AWS pour terraform**
1. Rendez-vous dans la console puis dans utilisateurs
   
<img width="909" alt="Creationdunekey" src="https://github.com/vessoutraore/Terraform/assets/126578500/c99a786a-664c-4996-af14-3c4f9216d4a5">

2. Cliquez sur créer une clé d'accès

<img width="759" alt="key" src="https://github.com/vessoutraore/Terraform/assets/126578500/8eac5021-23cc-4e6b-9eae-05f2f7dda3e3">

<img width="733" alt="key1" src="https://github.com/vessoutraore/Terraform/assets/126578500/6d7246f1-548f-41d5-8a60-eeec05e5f07f">

3. Cliquez enfin sur créer une clé

<img width="919" alt="key2" src="https://github.com/vessoutraore/Terraform/assets/126578500/8909f868-458d-47d4-93f3-fce50a835a59">

4. Puis terminer 

4. **Exécution des commandes** :
**$ terraform init & $ terraform apply**

Une fois exécuté, vous pouvez aller dans la EC2 d'aws pour votre l'instance qui a été créée. 

<img width="779" alt="creationdinstance" src="https://github.com/vessoutraore/Terraform/assets/126578500/fba28548-dc66-4a9f-a5bc-d4509f0dab9e">

Pour la détruire, on utilise la commande : **terraform destroy**

<img width="744" alt="destroy" src="https://github.com/vessoutraore/Terraform/assets/126578500/09bb9f78-0b45-45d3-96ce-90393e274e65">

En production, il est toujours recommandé d'utiliser la commande **terraform plan** pour visualiser votre configuration avant l'exécution.

Pour avoir le contenu de terraform plan dans un fichier, il faut la commande **terraform plan --out 'nom du fichier.out'**

<img width="634" alt="out" src="https://github.com/vessoutraore/Terraform/assets/126578500/5405e149-5a26-44de-8280-19daf93509d9">

Nous pouvons aussi utiliser la commande : **terraform apply "terraformplan.out"** pour créer une instance.

<img width="752" alt="terraformplanout" src="https://github.com/vessoutraore/Terraform/assets/126578500/05ffc21c-b917-4243-87dc-79cae7dd022c">

### Fournir des références dans une variable d'environnement

Il est possible d'exporter les références AWS dans une variable d'environnement au lieu de mettre dans le fichier comme :

```#### Set AWS environment variables

export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="your-region"

#### Display AWS environment variables

env | grep -i aws```


