-- Explosion = {}

local class = require 'lib/middleclass/middleclass'
require("Entity")
Explosion = class("Explosion", Entity)
Explosion.texture = nil
Explosion.width = 100
Explosion.height = 100

-- function Explosion:new(o)
--     o = o or {}   -- create object if user does not provide one
--     setmetatable(o, self)
--     self.__index = self
--     self.x = 0
--     self.y = 0
--     self.width = 100
--     self.height = 100
--     self.row = 0
--     self.column = 0
--     self.isDead = false
--     self.updateTime = 0.1
--     self.lastUpdate = 0
--     self.rotation = 0
--     self.scale = 1
--     return o
-- end

function Explosion:initialize (x, y)
    Entity.initialize(self, x, y)
    -- self.x = x
    -- self.y = y
    self.row = love.math.random(0, 4)
    self.column = 0
    self.isDead = false
    self.updateTime = 0.1
    self.lastUpdate = 0
    self.rotation = 0
    self.scale = 1
    self.quad = nil
end

function Explosion:load()
    Explosion.texture = love.graphics.newImage("Content/explosion.png")
    self.quad = love.graphics.newQuad(0, self.row * self.height, Explosion.width, Explosion.height, Explosion.texture:getDimensions())
end

function Explosion:draw()
    Entity:draw()
    love.graphics.draw(Explosion.texture, self.quad, self.x, self.y, self.rotation, self.scale, self.scale)
end

function Explosion:update(dt)
    if self.lastUpdate >= self.updateTime then
        self.lastUpdate = 0
        self.column = self.column + 1

        if self.column > 5 then
            self.isDead = true
        else
            self.quad = love.graphics.newQuad(self.column * self.width, self.row * self.height, Explosion.width, Explosion.height, Explosion.texture:getDimensions())
        end

    else
        self.lastUpdate = self.lastUpdate + dt
    end
end