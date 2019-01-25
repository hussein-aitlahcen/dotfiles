self: super:
{
  emacs = super.emacs.overrideAttrs (old: rec {
    name = "emacs-${version}${versionModifier}";
    version = "27.1";
    versionModifier = "";
    src = super.fetchurl {
      url = "mirror://gnu/emacs/${name}.tar.xz";
      sha256 = "0b6k1wq44rc8gkvxhi1bbjxbz3cwg29qbq8mklq2az6p1hjgrx0w";
    };
  });
}
