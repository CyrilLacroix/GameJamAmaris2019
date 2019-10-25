local vector = require("lib.vector")

Background = {}

function Background:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 0
    self.x2 = 0
    self.y2 = 0
    self.rotation = 0
    self.scale = 1.6
    self.background1 = nil
    self.background2 = nil
    self.ship = nil
    self.lastPosition = nil
    self.speed = 0.2
    return o
end

function Background:initialize (x, y, ship)
    self.x = x
    self.y = y
    -- width, height = love.graphics.getDimensions()
    self.ship = ship
    self.lastPosition = vector.new(ship.x, ship.y)
end

function Background:load ()
    self.background1 = love.graphics.newImage("Content/background1.jpg")
    self.background2 = love.graphics.newImage("Content/background2.png")
end

function Background:draw ()
    love.graphics.draw(self.background1, self.x, self.y, self.rotation, self.scale, self.scale)
    love.graphics.draw(self.background2, self.x2, self.y2, self.rotation, 1, 1)
end

function Background:update (dt)
        currentPosition = vector.new(self.ship.x, self.ship.y)
        direction = vector.__sub(self.lastPosition, currentPosition)
        -- print(string.format("CP: %s", currentPosition))
        -- print(string.format("LP: %s", self.lastPosition))
        -- print(string.format("D: %s", direction))
        self.x2 = self.x2 + (direction.x * self.speed)
        self.y2 = self.y2 + (direction.y * self.speed)
        self.lastPosition = vector.new(self.ship.x, self.ship.y)

end