self: super:
{
  emacs = super.emacs.overrideAttrs (old: rec {
    name = "emacs-${version}${versionModifier}";
    version = "27.1";
    versionModifier = "";
    src = super.fetchgit {
      url = "https://git.savannah.gnu.org/git/emacs.git";
      rev = "96e386e60de1d4ae9d702fc376ef7a9279a6aa66";
    };
  });
}
