{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  env.DATABASE_URL = "postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.postgresql_13 pkgs.dbmate pkgs.cargo-watch pkgs.mold];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  scripts.cw.exec = "cargo watch -x run";

  enterShell = ''
    hello
    git --version
    export PATH=$HOME/.cargo/bin:$PATH
    alias mold=${pkgs.mold}
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
