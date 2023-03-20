{ name = "tiptap"
, dependencies =
  [ "aff"
  , "console"
  , "effect"
  , "maybe"
  , "nullable"
  , "prelude"
  , "react-basic-hooks"
  , "typelevel-prelude"
  , "web-html"
  , "yjs"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
