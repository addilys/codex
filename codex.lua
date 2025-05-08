
codex = {
	draw = {},
	errhand = {love.errhand},
	errorhandler = {love.errorhandler},
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