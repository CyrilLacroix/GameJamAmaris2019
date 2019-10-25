Target = {}

function Target:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 0
    self.lowerBound = 0
    self.rotation = 0
    self.scale = 0.25
    self.isDead = false
    return o
end

function Target:initialize (x, y, world)
    self.x = x
    self.y = y
    width, self.lowerBound  = love.graphics.getDimensions()
    self.physic = {}
    self.physic.body = love.physics.newBody(world, self.x + 32, self.y + 32, "dynamic")
    self.physic.shape = love.physics.newRectangleShape(64, 64) 
    self.physic.fixture = love.physics.newFixture(self.physic.body, self.physic.shape)
    -- self.physic.body:applyLinearImpulse(0, 80, self.x + 32, self.y + 32)
    self.physic.body:setFixedRotation(true)
end

function Target:reset (y, x)
    self.isDead = false
    self.x = x
    self.y = y
    self.physic.body:setPosition(self.x, self.y)
    -- self.physic.body:applyLinearImpulse(0, 80, self.x + 32, self.y + 32)
end

function Target:load ()
    self.texture = love.graphics.newImage("Content/target.png")
end

function Target:draw ()

    if not self.isDead then
        self.x, self.y = self.physic.body:getPosition()
        love.graphics.draw(self.texture, self.x - 32, self.y - 32, self.rotation, self.scale, self.scale)

        love.graphics.setColor(0.28, 0.63, 0.05, 0.3)
        love.graphics.polygon("fill", self.physic.body:getWorldPoints(self.physic.shape:getPoints()))
        love.graphics.setColor(255, 255, 255)
    end
end

function Target:update (dt)
    if not self.isDead then
        -- self.y = self.y + (100 * dt)
        lx, ly = self.physic.body:getLinearVelocity( )
        if ly < 100 then
            self.physic.body:applyLinearImpulse(0, 10, self.x + 32, self.y + 32)
        end
        if self.y > self.lowerBound then
            self.isDead = true
        end
        -- self.physic.body:setPosition(self.x + 32, self.y + 32)
    end
end