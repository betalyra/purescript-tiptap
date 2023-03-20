import * as collab from '@tiptap/extension-collaboration'

export const collaboration = collab.default
export const configure = props => c => {
    return c.configure(props)
}
