# Terraform
Terraform avec AWS & GCP HandsOn Labs. Infrastructure as a Code, Terraform Associate Certification avec un seul cours

## Installer Terraform sur MacOS / Windows
### Installer Terraform sur Mac Machine -

Pour installer Terraform sur un ordinateur MAC, il suffit de copier-coller le script ci-dessous dans votre ordinateur local et de l'exécuter. Vous pouvez également exécuter les commandes données dans le script une par une, mais l'exécution complète du script est préférable à l'exécution d'une seule ligne de commande.

**mac-terraform-install.sh**

1. > brew install jq
brew install wget
cd ~
version=$(curl https://api.github.com/repos/hashicorp/terraform/releases/latest --silent | jq ".tag_name" -r)
version=$(echo $version | sed 's/v//g') # get rid of 'v' from version number
echo "Installing Terraform $version."
url="https://releases.hashicorp.com/terraform/$version/terraform_$(echo $version)_darwin_amd64.zip"
wget $url
unzip "terraform_$(echo $version)_darwin_amd64.zip"
chmod +x terraform
sudo mv terraform /usr/local/bin/
echo "Terraform $version installed."
rm "terraform_$(echo $version)_darwin_amd64.zip"
echo "Install files cleaned up."
