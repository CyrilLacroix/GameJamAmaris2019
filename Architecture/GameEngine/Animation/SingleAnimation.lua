SingleAnimation = {}

function SingleAnimation:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.row = 0
    self.column = 0
    self.currentColumn = 0
    self.isDead = false
    self.updateTime = 0.1
    self.lastUpdate = 0
    self.rotation = 0
    self.quad = nil
    self.width = 0
    self.height = 0
    self.centerX = 0
    self.centerY = 0
    self.x = 0
    self.y = 0
    self.xscale = 1
    self.yscale = 1
    return o
end

function SingleAnimation:load (path, column, width, height)
    self.column = column
    self.width = width
    self.height = height
    self.texture = love.graphics.newImage("Content/" .. path)
    textureWidth, textureHeigth = self.texture:getDimensions()
    self.centerX = textureWidth/2/column
    self.centerY = textureHeigth/2/column
    self.quad = love.graphics.newQuad(0, self.row * self.height, self.width, self.height, self.texture:getDimensions())
end

function SingleAnimation:draw ()
    love.graphics.draw(self.texture, self.quad, self.x, self.y, self.rotation, self.xscale, self.yscale, self.centerX, self.centerY)
end

function SingleAnimation:update (dt)
    if self.lastUpdate >= self.updateTime then
        self.lastUpdate = 0
        self.currentColumn = self.currentColumn + 1

        if self.currentColumn >= self.column then
            self.currentColumn  = 0
        end

        self.quad = love.graphics.newQuad(self.currentColumn * self.width, self.row * self.height, self.width, self.height, self.texture:getDimensions())

    else
        self.lastUpdate = self.lastUpdate + dt
    end
end

function SingleAnimation:move (x, y, rotation, xscale)
    self.x = x
    self.y = y
    self.rotation = rotation
    self.xscale = xscale
end

function SingleAnimation:reset ()
    self.currentColumn = 0
end