# data "openapi3_spec" "my_api" {
 # document_path = "./OpenAPISpec.yaml"
#}

data "template_file" "my_api" {
  #template = "OpenAPISpec.yaml"
   template = file("./OpenAPISpec.yaml")
 
 vars = {
 aws_region = var.AWS_REGION
}

}
data "aws_region" "current" {}

data "aws_caller_identity" "curret" {}
