#!/bin/bash

#Create a resource group
az group create --name storageGroup1 --location "eastu2"
#create a storage account 
az sorage account create -n davidstorageaccount -resource-group storageGroup1 --location eastu2 --sku Standard_LRS
AZURE_STORAGE_KEY=$(az storage account keys list --account-name almacenamientoap --resource-group grupoAlmacenamiento --query "[0].value" --output tsv)

# Crea un contenedor en la cuenta de almacenamiento
az storage container create --name amin --account-name almacenamientoap --account-key $AZURE_STORAGE_KEY
az storage container create --name oscar --account-name almacenamientoap --account-key $AZURE_STORAGE_KEY
az storage container create --name felipe --account-name almacenamientoap --account-key $AZURE_STORAGE_KEY

# Sube un archivo al contenedor
az storage blob upload --container-name amin --file ./comandos.sh --name comandos.sh --account-name almacenamientoap