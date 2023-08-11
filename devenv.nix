{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  env.DATABASE_URL = "postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.postgresql_13 pkgs.dbmate];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
    export PATH=$HOME/.cargo/bin:$PATH
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
