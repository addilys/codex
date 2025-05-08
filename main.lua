
require "codex"

function love.run()
	codex.handle("load",love.arg.parseGameArguments(arg), arg)
	local dt = 0

	-- Main loop time.
	return function()
		-- Process events.
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

		-- Update dt, as we'll be passing it to update
		if love.timer then dt = love.timer.step() end

		-- Call update and draw
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