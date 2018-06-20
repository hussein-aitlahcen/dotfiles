self: super:

{
  emacs26      = super.callPackage ./pkgs/emacs {};
  nodegit      = super.callPackage ./pkgs/nodegit {};
  clever-tools = super.callPackage ./pkgs/clever-tools {};
}
