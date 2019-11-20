#!/usr/bin/env bash

function check_installed {
    command -v $1 > /dev/null
}


check_installed aws


# AWS CLI installed
#command -v aws > /dev/null  # Check for AWS CLI binary, redirect path of binary to /dev/null

if [ $? == 0 ]; then   # Exit code  == '$?', 0 == success
    echo "AWS CLI is installed, continuing..."
else
    echo "AWS CLI is not installed, you need to install it to continue."; exit 1
fi


# aws configure
read -p "Do you want to run 'aws configure'? (y/n): " yn

case $yn in
    [Yy]* ) read -p "What name do you want to give this AWS profile?: " aws_profile_name; \
        aws configure \
            --profile "$aws_profile_name";; 
    [Nn]* ) echo "Skipping 'aws configure'...";;
    * ) echo "Please answer yes or no";;
esac


# Terraform
command -v terraform > /dev/null

if [ $? == 0 ]; then
    echo "Terraform is installed, continuing..."
else
    echo "Terraform is not installed, you need to install it to continue."; exit 1
fi


# Git
command -v git > /dev/null

if [ $? == 0 ]; then
    echo "Git is installed, continuing..."
else
    echo "Git is not installed, you need to install it to continue."; exit 1
fi

# Ansible
command -v ansible > /dev/null

if [ $? == 0 ]; then
    echo "Ansible is installed, continuing..."
else
    echo "Ansible is not installed, you need to install it to continue."; exit 1
fi
