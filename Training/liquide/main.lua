require("Water")
local moonshine = require("moonshine")

objects = {}
world = nil

function love.load ()
    effect = moonshine(moonshine.effects.fastgaussianblur)
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64, true)

    -- physic = {}
    width, height  = love.graphics.getDimensions()
    ground = {}
    ground.body = love.physics.newBody(world, width/2, height - 10 , "static")
    ground.shape = love.physics.newRectangleShape(width, 10)
    ground.fixture = love.physics.newFixture(ground.body, ground.shape)
    -- table.insert(objects, newWater)
end

function love.draw ()
    love.graphics.print(string.format("%s", table.getn(objects)), 0, 0)
    effect(function()
        for k,v in pairs(objects) do
            v:draw()
        end
    end)
end

function love.update (dt)
    world:update(dt)
    for k,v in pairs(objects) do
        v:update(dt)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for i=1,10 do
            newWater = Water:new()
            newWater:load(x + i, y + i)
            table.insert(objects, newWater)
        end
    end
 end