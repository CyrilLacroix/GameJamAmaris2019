require("GameEngine.Levels.Level1")
GameScreen = {}

CurrentLevel = Level1:new()

function GameScreen:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.title = "Game Screen"
    return o
end

function GameScreen:load ()
    CurrentLevel:load()
end

function GameScreen:draw ()
    love.graphics.print(self.title, 0, 0)
    CurrentLevel:draw()
end

function GameScreen:update (dt)
    CurrentLevel:update()
end