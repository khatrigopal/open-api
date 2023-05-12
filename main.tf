resource "aws_api_gateway_rest_api" "my_api" {
  
  name = "first-api-gateway"
  #body = data.openapi3_spec.my_api.json
  #body = file("${path.module}/openapi3_spec.my_api.yaml")
  body = data.template_file.my_api.rendered
  
}

resource "aws_lambda_permission" "allow_open_api" {
  statement_id = "AllowAPIGatewayInvokenew"
  action = "lambda.InvokeFunction"
  function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:us-west1-558940753150-${aws_api_gateway_rest_api.my_api}/*/*/*"
