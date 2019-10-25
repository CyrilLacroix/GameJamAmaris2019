Ship = {}
-- local class = require 'lib/middleclass/middleclass'
-- require("Entity")
-- Ship = class("Ship", Entity)

function Ship:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 0
    return o
end

function Ship:initialize (x, y, world)
    self.x = x
    self.y = y
    self.physic = {}
    self.physic.body = love.physics.newBody(world, self.x + 64, self.y + 64, "dynamic")
    self.physic.shape = love.physics.newRectangleShape(128, 128) 
    self.physic.fixture = love.physics.newFixture(self.physic.body, self.physic.shape)
end

function Ship:load ()
    self.texture = love.graphics.newImage("Content/ship.png")
end

function Ship:draw ()
    -- Entity:draw() -- Call Parent draw
    -- love.graphics.print("Ship", 400, 300)
    love.graphics.draw(self.texture, self.x, self.y)

    love.graphics.setColor(0.28, 0.63, 0.05, 0.3)
    love.graphics.polygon("fill", self.physic.body:getWorldPoints(self.physic.shape:getPoints()))
    love.graphics.setColor(255, 255, 255)

end

function Ship:update (dt)
    if love.keyboard.isDown('a') then self.x = self.x - (500 * dt) end
	if love.keyboard.isDown('d') then self.x = self.x + (500 * dt) end
	if love.keyboard.isDown('w') then self.y = self.y - (500 * dt) end
    if love.keyboard.isDown('s') then self.y = self.y + (500 * dt) end
    
    self.physic.body:setPosition(self.x + 64, self.y + 64)
end