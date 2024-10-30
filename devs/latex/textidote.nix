{ lib, stdenv, fetchurl, jdk }:

stdenv.mkDerivation rec {
  pname = "textidote";
  version = "0.8.3";

  # Specify the source of the JAR file
  src = fetchurl {
    url = "https://github.com/sylvainhalle/textidote/releases/download/${version}/textidote.jar";
    sha256 = "sha256-04862cc03ad5a8d101f89f53c01d05a29f800bcaaf3e8e7728653b8aea42eed9";
  };

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

