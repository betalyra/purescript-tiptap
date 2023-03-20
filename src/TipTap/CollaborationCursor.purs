module TipTap.CollaborationCursor
  ( CollaborationCursor

  , Props
  , collaborationCursor
  , configure
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable
import Effect (Effect)
import Effect.Aff.Compat (EffectFn1, mkEffectFn1)
import TipTap.TipTap (Extension)
import Type.Function (type ($))
import Web.HTML (HTMLElement)
import Yjs.Yjs as Yjs

foreign import data CollaborationCursor :: Type

foreign import collaborationCursor :: CollaborationCursor

type Props user = { provider :: Yjs.Provider, user :: user }

foreign import configureImpl :: forall user. Props user -> Nullable $ EffectFn1 user HTMLElement -> CollaborationCursor -> Extension

configure ∷ ∀ (user ∷ Type). Props user → Maybe (user -> Effect HTMLElement) → CollaborationCursor → Extension
configure props maybeRender = configureImpl props $ maybeRender <#> mkEffectFn1 # Nullable.toNullable
