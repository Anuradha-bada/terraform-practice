## Terraform Variables:
**Types:**
- Input variables
- Output variables
- Local variables

**Input variables:** specify values to create infrastructure , declared through variable block and they can hold data of different datatypes.

```
variable  “ami” {
       type = string
       default = “ami-1893”
       description =  “this is my ami id”
}
resource "aws_instance" "example12" {
  ami           = var.ami
  instance_type = var.type
}
```

**Validation rules:** specify custom validation rules using Validation block in relevant variable block

```
variable "ami" {
    type = string
    default = "ami-89098"
    validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The iami value must be a valid AMI id, starting with \"ami-\"."
  }
}
```

**Sensitive:true:** Setting a variable as sensitive prevents Terraform from showing its value in the plan or apply output, when you use that variable elsewhere in your configuration. But terraform will still record sensitive values in the state, and so anyone who can access the state data will have access to the sensitive values in cleartext

**Ways to define variables in terraform:**

- Within configuration files
- Via a CLI prompt during initialization or execution
- Via cli using -var flag (terraform plan -var= “ami=ami-9878”
- Via var file (.tfvars file or .tfvars json file)
   Ex: staging.tfvars, prod.tfvars
- Via Environment variables using TF_VAR_
   ex:Export TF_VAR_username =”prod”
- Via the terraform cloud or enterprise ui
  
**2. Output Variables:** useful to get endpoints, IPaddresses, etc in terminal outputs
```
Ouput “instance_id”{
Value= “aws_instance.example1.id”
}
Terraform output: to get outputs declared in the cli
```

**3.Local variables:** can be defined using locals block
Accessible within the modules/configuration file where they are declared
```
loclas {
     ami = “ami-9877”
     type =”t2.micro”
}
resource aws_instance “example1”{
     ami = local.ami
     instance_type = local.type
}```
