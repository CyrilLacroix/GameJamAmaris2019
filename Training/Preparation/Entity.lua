local class = require 'lib/middleclass/middleclass'
Entity = class("Entity")

-- function Entity:new (o, x, y)
--     o = o or {}   -- create object if user does not provide one
--     setmetatable(o, self)
--     self.__index = self
--     self.x = x or 0
--     self.y = y or 0
--     return o
-- end

function Entity:initialize(x, y)
  print(string.format("Entity => Initialize => x: %s, y: %s", x, y ))
  self.x = x
  self.y = y
end

function Entity:load()
end

function Entity:draw()
  love.graphics.print("Entity", self.x, self.y)
end

function Entity:update(dt)
end