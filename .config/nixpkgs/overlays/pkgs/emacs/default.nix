{ stdenv, fetchgit, autoreconfHook, pkgconfig, texinfo, gnutls
, gtk3 ? null, libXaw, libXext, libXpm, libjpeg, libpng, libtiff
, libungif, libxml2 , ncurses, gettext, acl, gpm, dbus
, libselinux, Xaw3d, alsaLib, imagemagick, libXft, librsvg
, xlibsWrapper, automake }:

stdenv.mkDerivation rec {
  name = "emacs-${version}${versionModifier}";
  version = "26.1";
  versionModifier = ".50";

  src = fetchgit {
    url = https://git.savannah.gnu.org/git/emacs.git;
    rev = "038063651ec0d16300095b9056282ffb1535c03a";
    sha256 = "1d973jxlvqvwmgjl8pnyd9cv82ywhjkag9f11x5cfgfvk3rnlfzc";
  };

  nativeBuildInputs = [
    autoreconfHook
    automake
    pkgconfig
    texinfo
  ];

  buildInputs = [
    gtk3
    gnutls
    libxml2
    libXaw
    libXext
    libXpm
    libXft
    libjpeg
    libpng
    libtiff
    libungif
    librsvg
    ncurses
    xlibsWrapper
    texinfo
    gettext
    gpm
    libselinux
    dbus
    Xaw3d
    alsaLib
    imagemagick
  ];

  CFLAGS = "-O3";

  configureFlags = [
    "--with-modules"
    "--with-x-toolkit=gtk3"
    "--with-xft"
  ];

  patchPhase = ''
    echo '(defun emacs-repository-get-version (&rest _) "${src.rev}")' >> lisp/version.el
    for f in $(find . -name Makefile.in); do
      substituteInPlace $f --replace /bin/pwd pwd
    done
  '';

  fixupPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp ${<nixpkgs/pkgs/applications/editors/emacs/site-start.el>} $out/share/emacs/site-lisp/site-start.el
    $out/bin/emacs --batch -f batch-byte-compile $out/share/emacs/site-lisp/site-start.el
  '';

  meta = with stdenv.lib; {
    description = "The extensible, customizable GNU text editor";
    homepage = https://www.gnu.org/software/emacs/;
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
