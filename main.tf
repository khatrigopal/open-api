#provider "openapi" {}

resource "aws_api_gateway_rest_api" "my_api_gateway" {
  body = jsonencode({
  "openapi": "3.0.0",
  "info": {
    "title": "My API",
    "version": "1.0.0"
  },
  "paths": {
    "/dev-rg-ano-mod": {
      "post": {
        "summary": "Run Inference",
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "data": {
                    "type": "object",
                    "properties": {
                      "totalCasinoStakeCentsUsdInWindow": {
                        "type": "object",
                        "additionalProperties": {
                          "type": "number"
                        },
                        "example": {
                          "0": 105,
                          "1": 25.65
                        }
                      },
                      "valueOfDepositsCentsUsdInWindow": {
                        "type": "object",
                        "additionalProperties": {
                          "type": "number"
                        },
                        "example": {
                          "0": 1,
                          "1": 2500.35
                        }
                      }
                    },
                    "required": [
                      "totalCasinoStakeCentsUsdInWindow",
                      "valueOfDepositsCentsUsdInWindow"
                    ]
                  }
                },
                "required": [
                  "data"
                ]
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "prediction": {
                      "type": "array",
                      "items": {
                        "type": "array",
                        "items": {
                          "type": "integer"
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "message": {
                      "type": "string"
                    }
                  }
                }
              }
            }
          }
        },

        #Please fix the below  add arn for credentials and remove line 99 and 100 as required
        "x-amazon-apigateway-integration": {
          "uri": "arn:aws:apigateway:us-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:558940753150:function:test-lambda/invocations",
          "httpMethod": "POST",
          "type": "aws_proxy",
          "passthroughBehavior": "when_no_match",
          "contentHandling": "CONVERT_TO_TEXT",
          "timeoutInMillis": 29000,
          "credentials": "NONE",
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Content-Type": "'application/json'"
              }
            }
          }
        }
      }
    }
  }
}
  name = "my-open-api-gateway"
  #body = data.openapi3_spec.my_api.json
}

