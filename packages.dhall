let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.7-20230320/packages.dhall
        sha256:6f2a4b50b793f304d3a64fd25d631de990de280981c73b0683a090e4fa499f0d

in  upstream
  with yjs =
    { dependencies =
      [ "console"
      , "effect"
      , "foreign"
      , "functions"
      , "newtype"
      , "prelude"
      , "web-dom"
      ]
    , repo = "https://github.com/rowtype-yoga/purescript-yjs.git"
    , version = "fc233e7"
    }
