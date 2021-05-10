---
swagger: "2.0"
info:
  version: "2020-04-24T11:01:28Z"
  title: "${api_name}"
basePath: "/"
schemes:
- "https"
paths:
  /alerts/generate/{origin}:
    parameters:
    - name: "origin"
      in: "path"
      required: true
      type: "string"
    post:
      consumes:
      - "application/json"
      produces:
      - "application/json"
      responses:
        200:
          description: "200 response"
          schema:
            $ref: "#/definitions/Empty"
          headers:
            Access-Control-Allow-Origin:
              type: "string"
      security:
        - api_key: []
      x-amazon-apigateway-integration:
        uri: "arn:aws:apigateway:${aws_region}:lambda:path/2015-03-31/functions/${ingest_alert_lambda_arn}/invocations"
        responses:
          default:
            statusCode: "200"
            responseParameters:
              method.response.header.Access-Control-Allow-Origin: "'*'"
        passthroughBehavior: "when_no_templates"
        requestTemplates:
        httpMethod: "POST"
        contentHandling: "CONVERT_TO_TEXT"
        type: "aws_proxy"
    options:
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        200:
          description: "200 response"
          schema:
            $ref: "#/definitions/Empty"
          headers:
            Access-Control-Allow-Origin:
              type: "string"
            Access-Control-Allow-Methods:
              type: "string"
            Access-Control-Allow-Headers:
              type: "string"
      x-amazon-apigateway-integration:
        responses:
          default:
            statusCode: "200"
            responseParameters:
              method.response.header.Access-Control-Allow-Methods: "'GET,OPTIONS,PUT,DELETE'"
              method.response.header.Access-Control-Allow-Headers: "'Access-Control-Allow-Headers,Access-Control-Allow-Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
              method.response.header.Access-Control-Allow-Origin: "'*'"
        requestTemplates:
          application/json: "{\"statusCode\": 200}"
        passthroughBehavior: "when_no_match"
        type: "mock"
securityDefinitions:
  api_key:
    type: "apiKey"
    name: "x-api-key"
    in: "header"
definitions:
  Empty:
    type: "object"
    title: "Empty Schema"
x-amazon-apigateway-gateway-responses:
  DEFAULT_5XX:
    responseParameters:
      gatewayresponse.header.Access-Control-Allow-Methods: "'GET,OPTIONS,POST'"
      gatewayresponse.header.Access-Control-Allow-Origin: "'*'"
      gatewayresponse.header.Access-Control-Allow-Headers: "'Access-Control-Allow-Headers,Access-Control-Allow-Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
  DEFAULT_4XX:
    responseParameters:
      gatewayresponse.header.Access-Control-Allow-Methods: "'GET,OPTIONS,POST'"
      gatewayresponse.header.Access-Control-Allow-Origin: "'*'"
      gatewayresponse.header.Access-Control-Allow-Headers: "'Access-Control-Allow-Headers,Access-Control-Allow-Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
