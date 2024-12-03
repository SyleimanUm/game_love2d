---@diagnostic disable-next-line: lowercase-global
_G.love = require("love")

function love.load()
jack = {
        x = 0,
        y = 0,
        sprite = love.graphics.newImage("img/run.png"),

        animation = {
            dirction = "right",
            idle = true,
            frame = 1,
            max_frames = 8,
            speed = 30,
            timer = 0.1
        }
    }
SPRITE_WIDTH, SPRITE_HEIGHT = 5352, 569
QUAD_WIDTH = 669
QUAD_HEIGTH = SPRITE_HEIGHT


quads = {}

for i = 1, jack.animation.max_frames  do
    quads[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 0, QUAD_WIDTH, QUAD_HEIGTH, SPRITE_WIDTH, SPRITE_HEIGHT)
end

end

function love.update(dt)

    if love.keyboard.isDown("d") then
        jack.animation.idle = false
        jack.animation.dirction = "right"
    elseif love.keyboard.isDown("a") then
        jack.animation.idle = false
        jack.animation.dirction = "left"
    else
        jack.animation.idle = true
        jack.animation.frame = 1
    end


    if not jack.animation.idle then
        jack.animation.timer = jack.animation.timer + dt

        if jack.animation.timer > 0.2 then
            jack.animation.timer = 0.1

            jack.animation.frame = jack.animation.frame + 1

            if jack.animation.dirction == "right" then
                jack.x = jack.x + jack.animation.speed
            elseif jack.animation.dirction == "left" then
                jack.x = jack.x - jack.animation.speed
            end

            if jack.animation.frame > jack.animation.max_frames then
                jack.animation.frame = 1
            end
            
        end
    end

end

function love.draw()
    love.graphics.scale(0.3)
    
    if jack.animation.dirction == "right" then
        love.graphics.draw(jack.sprite, quads[jack.animation.frame], jack.x, jack.y)
    else 
        love.graphics.draw(jack.sprite, quads[jack.animation.frame], jack.x, jack.y, 0, -1, 1, QUAD_WIDTH + 100, 0)
    end
end 