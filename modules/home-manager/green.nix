{
  ...
}:
{
  programs.fish = {
    shellAbbrs = {
      # aws
      aws-dev = "export AWS_PROFILE=development";
      aws-prod = "export AWS_PROFILE=production";
      aws-login = "aws sso login";
    };

  };
}
