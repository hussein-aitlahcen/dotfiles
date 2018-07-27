self: super:
{
  # Newer emacs
  emacs26 = super.callPackage ./pkgs/emacs {};

  # Haskell IDE Engine
  hies = import (super.fetchFromGitHub {
           owner  = "domenkozar";
           repo   = "hie-nix";
           rev    = "e3113da93b479bec3046e67c0123860732335dd9";
           sha256 = "05rkzjvzywsg66iafm84xgjlkf27yfbagrdcb8sc9fd59hrzyiqk";
         });
}
