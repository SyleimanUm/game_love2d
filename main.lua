---@diagnostic disable-next-line: lowercase-global
_G.love = require("love")

local player = {
    radius = 20,
    x = 30,
    y = 30
}

local game = {
    state = {
        menu = true,
        paused = false,
        running = false,
        ended = false,

    }
}

function love.load()
    love.mouse.setVisible(false)
end

function love.update(dt)
    player.x, player.y = love.mouse.getPosition()
end

function love.draw()
    love.graphics.printf("FPS: " .. love.timer.getFPS(), love.graphics.newFont(16), 10, love.graphics.getHeight() - 30, love.graphics.getWidth())

    if game.state["running"] then
        love.graphics.circle("fill", player.x, player.y,  player.radius) 
    end

    if not game.state["runnig"] then
        love.graphics.circle("fill", player.x, player.y,  player.radius / 2)
    end

end