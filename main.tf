


resource "aws_api_gateway_rest_api" "my_api_gateway" {
  
  name = "my-open-api-gateway"
  #body = data.openapi3_spec.my_api.json
  #body = file("${path.module}/openapi3_spec.my_api.yaml")
  body = data.template_file.my_api.rendered
  
}

vars = {
    aws_region              = var.AWS_REGION
    account_id              = var.account_map
  }
