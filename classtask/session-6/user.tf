resource "aws_iam_user" "users" {
  for_each = var.user_list
  name = each.key
  

  tags = {
    tag-key = "Name"
    tag-value = "Intern"
  }
}

resource "aws_iam_user" "users_map" {
  for_each = var.user_map
  name = each.value
  
}
