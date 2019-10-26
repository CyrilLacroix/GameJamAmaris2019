AudioManager = {}

function AudioManager:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function AudioManager:load ()
end

function AudioManager:draw ()
end

function AudioManager:update (dt)
end