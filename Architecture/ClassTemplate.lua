Template = {}

function Template:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Template:load ()
end

function Template:draw ()
end

function Template:update (dt)
end