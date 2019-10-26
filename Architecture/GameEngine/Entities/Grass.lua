require("GameEngine.Helper.ContentLoader")
Grass = {}

function Grass:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.texture = nil
    self.x = 0
    self.y = 0
    return o
end

function Grass:load (x, y)
    self.x = x
    self.y = y
    self.texture = love.graphics.newImage("Content/Grass.jpg")
    -- self.texture = ContentLoader.GrassTexture
end

function Grass:draw ()
    love.graphics.draw(self.texture, self.x, self.y)
end

function Grass:update (dt)
end