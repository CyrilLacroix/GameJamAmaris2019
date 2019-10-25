Water = {}

function Water:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 0
    self.radius = 30
    self.physic = nil
    return o
end

function Water:load (x, y)
    self.x = x
    self.y = y
    self.physic = {}
    self.physic.body = love.physics.newBody(world, self.x + (self.radius/2), self.y + (self.radius/2), "dynamic")
    self.physic.shape = love.physics.newCircleShape(self.radius)
    self.physic.fixture = love.physics.newFixture(self.physic.body, self.physic.shape)
end

function Water:draw ()
    x, y = self.physic.body:getWorldPoints(self.physic.shape:getPoint())
    love.graphics.circle("fill", x, y, self.radius)
end

function Water:update (dt)
end