module TipTap.StarterKit where

import Prelude

import TipTap.TipTap (Extension)

foreign import data StarterKit :: Type

foreign import starterKit :: StarterKit 

type Props = { history :: Boolean }

foreign import configure :: Props -> StarterKit -> Extension
