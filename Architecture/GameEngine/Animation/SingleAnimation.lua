SingleAnimation = {}

function SingleAnimation:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function SingleAnimation:load ()
end

function SingleAnimation:draw ()
end

function SingleAnimation:update (dt)
end