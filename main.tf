


resource "aws_api_gateway_rest_api" "my_api_gateway" {
  
  name = "my-open-api-gateway"
  #body = data.openapi3_spec.my_api.json
  #body = file("${path.module}/openapi3_spec.my_api.yaml")
  body = data.template_file.my_api.rendered
  
}

resource "aws_lambda_permission" "api-gateway-invoke-lambda" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "test-lambda"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the specified API Gateway.
  source_arn = "aws_api_gateway_rest_api.my_api_gateway.execution_arn/*/*"
}

