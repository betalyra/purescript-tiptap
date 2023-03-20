module TipTap.Collaboration where

import Prelude

import TipTap.TipTap (Extension)
import Yjs.Yjs as Yjs

foreign import data Collaboration :: Type

foreign import collaboration :: Collaboration

type Props = { fragment :: Yjs.YXmlFragment }

foreign import configure :: Props -> Collaboration -> Extension
