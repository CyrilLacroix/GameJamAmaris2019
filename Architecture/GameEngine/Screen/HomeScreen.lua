HomeScreen = {}

function HomeScreen:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.title = "Home Screen"
    return o
end

function HomeScreen:load ()
end

function HomeScreen:draw ()
    love.graphics.print(self.title, 0, 0)
end

function HomeScreen:update (dt)
end