## Terraform + Ansible + GCP project

### How to run
- `cd CloudBigDataProject`
- `bash scripts/deploy`
- Change some hard code things:
    - Look for node ip in `ansible/inventory.ini `, add the ip address to the corresponding parameters in `scripts/count.sh`
    - In Line 86 of `scripts/count.sh` to `--master spark://<MASTER_PRIVATE_IP>:7077\`
- `bash scripts/count.sh`

### Test case
- Change executor core `--total-executor-cores 4 \`
- Change number of worker in `terraform/terraform.tfvars` but the `deploy.sh` file is hard code so modification is required

#### Report is written in 22/11 (DD/MM)  