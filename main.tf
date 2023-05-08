resource "aws_api_gateway_rest_api" "my_api" {
  
  name = "first-api-gateway"
  #body = data.openapi3_spec.my_api.json
  #body = file("${path.module}/openapi3_spec.my_api.yaml")
  body = data.template_file.my_api.rendered
  
}

