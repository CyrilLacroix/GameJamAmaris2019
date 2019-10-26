Button = {}

function Button:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Button:load ()
end

function Button:draw ()
end

function Button:update (dt)
end