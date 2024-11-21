## Create Azure resources by Terraform
```bash
terraform init
terraform apply --auto-approve -var-file="values.tfvars"
terraform destroy --auto-approve -var-file="values.tfvars"
```