{ lib, stdenv, fetchurl, jdk }:

stdenv.mkDerivation rec {
  pname = "textidote";
  version = "0.8.3";

  # Specify the source of the JAR file
  src = fetchurl {
    url = "https://github.com/sylvainhalle/textidote/releases/download/v0.8.3/textidote.jar";
    sha256 = "sha256-BIYswDrVqNEB+J9TwB0Fop+AC8qvPo53KGU7iupC7tk=";
    curlOpts = "-L -H Accept:application/octet-stream";
  };

  phases = ["installPhase"];

  # src = fetchFromGitHub {
  #   owner = "sylvainhalle";
  #   repo = "textidote";
  #   rev = "v0.9";
  #   sha256 = lib.fakeSha256;
  # };

  # The Java runtime environment needed to run the program
  buildInputs = [ jdk ];

  # Specify the output binary directory
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/java
    cp $src $out/share/java/textidote.jar

    # Create a wrapper script to run the jar file
    cat > $out/bin/textidote <<EOF
    #!${stdenv.shell}
    exec ${jdk}/bin/java -jar $out/share/java/textidote.jar "\$@"
    EOF

    chmod +x $out/bin/textidote
  '';

  meta = with lib; {
    description = "Grammar checker for LaTeX files";
    license = licenses.gpl3; # Adjust as appropriate
    platforms = platforms.all;
  };
}

