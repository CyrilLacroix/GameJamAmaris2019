local json = require 'lib/debug/dkjson'
local debuggee = require 'lib/debug/vscode-debuggee'
local startResult, breakerType = debuggee.start(json)
print('debuggee start ->', startResult, breakerType)

require("Ship")
require("Explosion")
require("Target")
require("Background")
require("UI.debug.fps")

ship1 = nil
target1 = Target:new()
background = Background:new()
explosions = {}

lastSpace = 0
lastSpawn = 0

-- Physics
objects = {} -- table to hold all our physical objects
world = nil

function love.load()

    -- Physics
    love.physics.setMeter(64) --the height of a meter our worlds will be 64px
    world = love.physics.newWorld(0.1, 0.1, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
    -- Physics
    print("Ship new")

    ship1 = Ship:new()
    ship1:load()
    ship1:initialize(0,0, world)
    target1:load()
    target1:initialize(200, 0, world)
    background:load()
    background:initialize(0, 0, ship1)
end

function love.draw()

    love.graphics.setColor(255, 255, 255)
    background:draw()
    Fps:draw()
    love.graphics.print(string.format("Explosions: %s", table.getn(explosions)), 0, 30)
    ship1:draw()
    target1:draw()

    for k,v in pairs(explosions) do
        v:draw()
    end
end

function love.update(dt)
    -- Physics
    world:update(dt) --this puts the world into motion
    -- Physics

    background:update(dt)
    Fps:update(dt)
    ship1:update(dt)
    target1:update(dt)

    for k,v in pairs(explosions) do
        if v.isDead then
            table.remove(explosions, k)
        else
            v:update(dt)
        end
    end

    if love.keyboard.isDown('space') then
        if lastSpace >= 0.250 then
            lastSpace = 0
            newExplosion = Explosion:new()
            print(string.format( "Ship => Create Explosion => x: %s, y: %s", ship1.x, ship1.y ))
            newExplosion:initialize(ship1.x, ship1.y)
            newExplosion:load()
            table.insert(explosions, newExplosion)
        else
            lastSpace = lastSpace + dt
        end
     end

    if target1.isDead then
        target1:reset(0, love.math.random( 25, 400))
    end
    if debuggee then debuggee.poll() end
end


-- function love.keypressed(key, u)
--     --Debug
--     if key == "rctrl" then --set to whatever key you want to use
--        debug.debug()
--     end
--  end