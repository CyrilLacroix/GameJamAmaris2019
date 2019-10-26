Level1 = {}

function Level1:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Level1:load ()
end

function Level1:draw ()
end

function Level1:update (dt)
end