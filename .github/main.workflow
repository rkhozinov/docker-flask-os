workflow "Check" {
  on = "push"
  resolves = ["lint", "build"]
}

action "lint" {
  uses = "actions/docker/cli@master"
  args = "run -i hadolint/hadolint hadolint - < Dockerfile"
}

action "build" {
  uses = "actions/docker/cli@master"
  args = "build -t flask-os  ."
}
