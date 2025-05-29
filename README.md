# codex
Simple alternative LÖVE event handler using per-callback tables of functions with the `next` operator.
## Functions
`codex.add(key,table)` is used to add a table of love callback functions to their respective codex tables under the given key.

`codex.remove(key)` deletes every function with the given key in each codex event table.

`codex.pages.getPage(number)` is used to get a graphics layer table to add draw functions to.
# pages
Draw function layering system for codex. Could be repurposed for anything else, I don't care really.
# Tips & Recommended Use
```
-- you can add to codex directly with a function declaration
require "codex/codex"
function codex.update.example(dt) end

-- or assignment of a function
function mykeycode(k) print(k) end
codex.keypressed.exampletwo = mykeycode

-- or you can batch add functions from a properly formatted table
exampleThree = {}
function exampleThree.load()
function exampleThree.update(dt) end
function exampleThree.keypressed(k) end
codex.add("exampleLibrary",exampleThree)

--- however, you cannot add draw functions. pages implements these.

----- pages!
-- pages is a sublibrary that is required by codex but does not require codex.
-- you will likely access these functions through codex.pages instead of pages.

-- unless you add this line, i guess.
local pages = codex.pages

-- get a page or two.
local pageone = pages.getPage(1)
local pagetwo = pages.getPage(2)

-- we can add to the pages with our direct codex function assignment techniques
-- direct function declaration
function pagetwo.example()
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",0,0,love.graphics.getWidth()/2,love.graphics.getHeight())
end

-- or assign the draw function.
function drawFunc()
  love.graphics.setColor(1,1,1,1)
  love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
end
pageone.example = drawFunc

-- will update this with more notes on usage later.
