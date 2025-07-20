with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    ffmpeg
    git
    gnupg
    imagemagick
    jpegoptim
    optipng
    pre-commit
  ];
}
