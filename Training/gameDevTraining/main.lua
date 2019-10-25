require("Ship")

ship1 = nil
ship2 = nil

function love.load ()
    ship1 = Ship:new()
    ship1:load(100, 100)

    ship2 = Ship:new()
    ship2:load(200, 200)
end

function love.draw ()
    love.graphics.print("GameOfDraw", 0, 0, 0 , 1, 1)
    ship1:draw()
    ship2:draw()
end

function love.update (dt)
    ship1:update(dt)
    ship2:update(dt)
end