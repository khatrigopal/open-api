


resource "aws_api_gateway_rest_api" "my_api_gateway" {
  
  name = "my-open-api-gateway"
  #body = data.openapi3_spec.my_api.json
  body = file("${path.module}/openapi3_spec.my_api.yaml")
}
