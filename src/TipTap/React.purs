module TipTap.React where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable
import Effect (Effect)
import Effect.Aff.Compat (EffectFn1, runEffectFn1)
import React.Basic.Hooks (Hook, JSX, ReactComponent, unsafeHook)
import TipTap.TipTap (Extension)

foreign import data Editor :: Type

type Props = { extensions :: Array Extension }

foreign import useEditorImpl :: EffectFn1 Props (Nullable Editor)

foreign import data UseEditor :: Type -> Type

useEditor ∷ Props -> Hook (UseEditor) (Maybe Editor)
useEditor props = unsafeHook $ runEffectFn1 useEditorImpl props <#> Nullable.toMaybe

foreign import editorContent :: ReactComponent { editor :: Editor }

type TippyOptions = { duration :: Int }

foreign import bubbleMenu :: ReactComponent { children :: Array JSX, editor :: Editor, tippyOptions :: TippyOptions }

foreign import data ChainedCommands :: Type

class ChainedCommandsBuilder input output | input -> output where
  chain :: input -> Effect output
  focus :: input -> Effect output
  toggleBold :: input -> Effect output
  toggleItalic :: input -> Effect output
  toggleStrike :: input -> Effect output

foreign import chainImpl :: forall input output. EffectFn1 input output
foreign import focusImpl :: forall input output. EffectFn1 input output
foreign import toggleBoldImpl :: forall input output. EffectFn1 input output
foreign import toggleItalicImpl :: forall input output. EffectFn1 input output
foreign import toggleStrikeImpl :: forall input output. EffectFn1 input output

instance ChainedCommandsBuilder Editor ChainedCommands where
  chain = runEffectFn1 chainImpl
  focus = runEffectFn1 focusImpl
  toggleBold = runEffectFn1 toggleBoldImpl
  toggleItalic = runEffectFn1 toggleItalicImpl
  toggleStrike = runEffectFn1 toggleStrikeImpl

instance ChainedCommandsBuilder ChainedCommands ChainedCommands where
  chain = runEffectFn1 chainImpl
  focus = runEffectFn1 focusImpl
  toggleBold = runEffectFn1 toggleBoldImpl
  toggleItalic = runEffectFn1 toggleItalicImpl
  toggleStrike = runEffectFn1 toggleStrikeImpl

foreign import run :: ChainedCommands -> Effect Boolean
