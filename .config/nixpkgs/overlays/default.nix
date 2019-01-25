self: super:
{
  # custom emacs
  emacs = super.emacs.overrideAttrs (old: {
    version = "27.1";
  })
}
