This repository contains code which was used for the *Exploring Reproducible Computing Systems using Machine Learning Applications* thesis. There are two main directories within this repository covered in the following two sections.

## chef
This subdirectory contains all of the Chef cookbooks leveraged for this work. There are three key Chef cookbooks:
1. **docker** - The Docker cookbook
2. **nvidia** - The NVIDIA cookbook
3. **singularity** - The Singularity cookbook
   
## terraform
This subdirectory contains all of the Terraform code to provision the environment in two clouds:
1. **aws** - AWS Terraform code
2. **azure** - Azure code

The `cloud-user-data.txt` file contained in this directory is referenced in the Terraform code to be leveraged across both clouds. It creates the default Chef setup for a running virtual machine. 
