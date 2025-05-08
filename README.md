codex is an event handler library for love2d.
This is accomplished through replacing core functionality with the love.run function.
Instead of attempting to run love.load, for example, it will call any functions inside of the codex.load table and provide them the same arguments.
Every love callback has a corresponding codex table.
You can declare a function directly with function codex.eventname.keyname or you can add a table full of event functions all at once.
The key, or, the name of each codex table entry, can be used with codex.delete to bulk delete all functions with that key.
