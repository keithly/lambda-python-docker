resource "aws_lambda_function" "python_custom" {
  depends_on = [
    null_resource.ecr_image
  ]
  function_name = "lambda-python-custom"
  role          = aws_iam_role.lambda_python_custom.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.repo.repository_url}@${data.aws_ecr_image.lambda_image.image_digest}"
}

resource "aws_lambda_function_url" "latest" {
  function_name      = aws_lambda_function.python_custom.function_name
  authorization_type = "NONE"
}
