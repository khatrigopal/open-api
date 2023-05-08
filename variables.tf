variable "aws_region" {
  description = "aws region"
  #type        = string
  default     = "us-east-1"
}

variable "account_map" {
 description = "account id"
 default = {
   dev = "558940753150"
   intg = "558940753150"
 }
}
