require("GameEngine.Animation.SingleAnimation")

Player = {}

function Player:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = 0
    self.y = 500
    self.rotation = 0
    self.texture = nil
    self.xscale = 1
    self.yscale = 1
    self.animation = SingleAnimation:new()
    self.updated = false
    return o
end

function Player:load ()
    self.animation:load("sprite.png", 5, 256, 256)
    self.animation:move(self.x, self.y, self.rotation, self.xscale)

    local img = love.graphics.newImage('Content/cloud.png')

	psystem = love.graphics.newParticleSystem(img, 32)
	psystem:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(0)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0) -- Fade to transparency.
    psystem:setSizes(0.2)
end

function Player:draw ()
    self.animation:draw()
    love.graphics.draw(psystem, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
end

function Player:update (dt)
    self.updated = false

    if love.keyboard.isDown("q") then 
        self.rotation = self.rotation - 0.1
        self.updated = true
    end
    if love.keyboard.isDown("e") then 
        -- self.rotation = self.rotation + 0.1
        -- self.updated = true
        psystem:setEmissionRate(5)
        psystem:setPosition(self.x-(1280/2), self.y-(760/2))
    end
    if love.keyboard.isDown("e") == false then 
        psystem:setEmissionRate(0)
    end
    if love.keyboard.isDown("a") then 
        self.x = self.x - 2 
        self.xscale = -1
        self.yscale = 1
        self.updated = true
    end
    if love.keyboard.isDown("d") then 
        self.x = self.x + 2 
        self.xscale = 1
        self.yscale = 1
        self.updated = true
    end

    if self.updated == true then
        self.animation:move(self.x, self.y, self.rotation, self.xscale)
        self.animation:update(dt)
    end

    if self.updated == false then
        self.animation:reset()
        self.animation:update(dt)
    end
    psystem:update(dt)
end