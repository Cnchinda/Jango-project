
variable "cidr_block" {
    type = string
    description = "Jango vpc cidr"
    default  = "10.0.0.0/16"
  
}

variable "Jango_private_subnets" {
    description = "3 subnet for the Jango project"
    type = list(any)
    default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "Jango_public_subnets" {
    description = "3 subnet for the Jango project"
    type = list(any)
    default = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
}

variable "Jango_data_subnets" {
    description = "3 subnet for the Jango project"
    type = list(any)
    default = ["10.0.31.0/24", "10.0.32.0/24", "10.0.33.0/24"]
}

variable "instance_type" {
    description = "3 subnet for the Jango project"
    type = list(any)
    default = ["t2.micro", "t2.small", "t2.nano"]
}