require("GameEngine.Helper.ContentLoader")
Cloud = {}

function Cloud:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.texture = nil
    self.x = 0
    self.y = 0
    return o
end

function Cloud:load (x, y)
    self.x = x
    self.y = y
    self.texture = ContentLoader.CloudTexture
end

function Cloud:draw ()
    love.graphics.setColor( 1, 1, 1, 1 )
    love.graphics.draw(self.texture, self.x, self.y, 0, 0.5, 0.5)

end

function Cloud:update (dt)
end