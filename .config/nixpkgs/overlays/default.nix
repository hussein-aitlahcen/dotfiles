self: super:
{
  emacs = super.emacs.overrideAttrs (old: rec {
    name = "emacs-${version}${versionModifier}";
    version = "27.1";
    versionModifier = "";
    patches = [
      ./emacs.patch
    ];
    src = super.fetchgit {
      url = "https://git.savannah.gnu.org/git/emacs.git";
      rev = "96e386e60de1d4ae9d702fc376ef7a9279a6aa66";
      sha256 = "sha256:11k5ldi33cq1dk3w9i11cr9xl5mc7f5mnxpvqlzsnm6gfijz4cas";
    };
  });
}
