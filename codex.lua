--[[ codex by addilyz
MIT License

Copyright (c) 2025 addilyz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

codex = {
	draw = {},
	errhand = {love = love.errhand},
	errorhandler = {love = love.errorhandler},
	load = {},
	lowmemory = {},
	threaderror = {},
	update = {},
	directorydropped = {},
	filedropped = {},
	focus = {},
	mousefocus = {},
	resize = {},
	visible = {},
	keypressed = {},
	keyreleased = {},
	textedited = {},
	textinput = {},
	mousemoved = {},
	mousepressed = {},
	mousereleased = {},
	wheelmoved = {},
	gamepadaxis = {},
	gamepadpressed = {},
	gamepadreleased = {},
	joystickadded = {},
	joystickaxis = {},
	joystickhat = {},
	joystickpressed = {},
	joystickreleased = {},
	joystickremoved = {},
	touchmoved = {},
	touchpressed = {},
	touchreleased = {}
}

function codex.handle(name,a,b,c,d,e,f)
	for k, v in next, codex[name] do
		v(a,b,c,d,e,f)
	end
end

function codex.delete(key)
	for k, v in next, codex do
		if type(v) == "table" then
			v[key] = nil
		end
	end
end

function codex.add(key,tab)
	for k, v in next, tab do
		if codex[k] then codex[k][key] = v end
	end
end

function love.run()
	codex.handle("load",love.arg.parseGameArguments(arg), arg)
	local dt = 0
	return function()
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				codex.handle(name,a,b,c,d,e,f)
			end
		end
		if love.timer then dt = love.timer.step() end
		codex.handle("update",dt)
		if love.graphics and love.graphics.isActive() then
			love.graphics.origin()
			love.graphics.clear(love.graphics.getBackgroundColor())
			codex.handle("draw")
			love.graphics.present()
		end
		if love.timer then love.timer.sleep(0.001) end
	end
end
