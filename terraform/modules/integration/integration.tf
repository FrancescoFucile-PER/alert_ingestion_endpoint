variable "service_id" {
  type = string
}

variable "usage_plan_id" {
  type = string
}

output "api_key" {
  value = aws_api_gateway_api_key.api_key.value
}

resource "aws_api_gateway_api_key" "api_key" {
  name = "${var.service_id}_api_key"
}

resource "aws_api_gateway_usage_plan_key" "integration_api_key_usage_plan" {
  key_id = aws_api_gateway_api_key.api_key.id
  key_type = "API_KEY"
  usage_plan_id = var.usage_plan_id
}