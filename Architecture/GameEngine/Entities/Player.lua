Player = {}

function Player:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Player:load ()
    self.texture = love.graphics.newImage("Content/mario.png")
    self.x = x
    self.y = y
end

function Player:draw ()
    love.graphics.draw(self.texture, self.x, self.y, 0, 0.1, 0.1)
end

function Player:update (dt)
    if love.keyboard.isDown("a") then self.x = self.x - 1 end
    if love.keyboard.isDown("d") then self.x = self.x + 1 end
    if love.keyboard.isDown("w") then self.y = self.y - 1 end
    if love.keyboard.isDown("s") then self.y = self.y + 1 end
end