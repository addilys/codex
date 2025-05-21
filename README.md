# codex
Simple alternative LÖVE event handler using per-callback tables of functions with the `next` operator.
## Functions
`codex.add(key,table)` is used to add a table of love callback functions to their respective codex tables under the given key.

`codex.remove(key)` deletes every function with the given key in each codex event table.

`codex.pages.getPage(number)` is used to get a graphics layer table to add draw functions to.
# pages
Draw function layering system for codex. Could be repurposed for anything else, I don't care really.
