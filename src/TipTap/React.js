
import * as tiptap from "@tiptap/react";


export const useEditorImpl = (options) => tiptap.useEditor(options)

export const editorContent = tiptap.EditorContent

export const bubbleMenu = tiptap.BubbleMenu

export const chainImpl = (input) => input.chain()
export const focusImpl = (input) => input.focus()
export const toggleItalicImpl = (input) => input.toggleItalic()
export const toggleBoldImpl = (input) => input.toggleBold()
export const toggleStrikeImpl = (input) => input.toggleStrike()

export const run = (chainedCommand) => () => chainedCommand.run()
