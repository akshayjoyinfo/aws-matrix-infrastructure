env=dev
terraform get -update=true
terraform init -reconfigure -backend-config=backend-config/backend-dev.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars


terraform init -reconfigure -backend-config="configs/dev.conf"

terraform get -update=true
terraform init -reconfigure -backend-config="../configs/dev.conf"

terraform init -reconfigure -backend-config=configs/dev.conf


## DEV
=======

terraform get -update=true
terraform init -reconfigure -backend-config="../configs/dev.conf"
terraform plan -var-file="../tfvars/dev.tfvars"
terraform apply -var-file="../tfvars/dev.tfvars"
terraform destroy -var-file="../tfvars/dev.tfvars"


## TEST
=======

terraform get -update=true
terraform init -reconfigure -backend-config="../configs/test.conf"
terraform plan -var-file="../tfvars/test.tfvars"
terraform apply -var-file="../tfvars/test.tfvars"
terraform destroy -var-file="../tfvars/test.tfvars"