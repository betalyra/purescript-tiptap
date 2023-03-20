import * as collabcursor from "@tiptap/extension-collaboration-cursor";

export const collaborationCursor = collabcursor.default;
export const configureImpl =
  ({ provider, user }) =>
  (render) =>
  (c) => {
    if (render != null) {
      return c.configure({ provider, user, render });
    } else {
      return c.configure({ provider, user });
    }
  };
