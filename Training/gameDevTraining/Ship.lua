Ship = {}

function Ship:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 0
    self.texture = nil
    return o
end

function Ship:load (x, y)
    self.texture = love.graphics.newImage("Content/mario.png")
    self.x = x
    self.y = y
end

function Ship:draw ()
    love.graphics.draw(self.texture, self.x, self.y, 0, 0.1, 0.1)
end

function Ship:update (dt)
    if love.keyboard.isDown("a") then self.x = self.x - 1 end
    if love.keyboard.isDown("d") then self.x = self.x + 1 end
    if love.keyboard.isDown("w") then self.y = self.y - 1 end
    if love.keyboard.isDown("s") then self.y = self.y + 1 end
end