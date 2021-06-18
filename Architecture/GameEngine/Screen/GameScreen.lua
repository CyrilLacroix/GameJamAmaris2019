require("GameEngine.Levels.Level1")
GameScreen = {}

function GameScreen:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.title = "Game Screen"
    self.CurrentLevel = Level1:new()
    return o
end

function GameScreen:load ()
    self.CurrentLevel:load()
end

function GameScreen:draw ()
    self.CurrentLevel:draw()
    love.graphics.print(self.title, 0, 0)
end

function GameScreen:update (dt)
    self.CurrentLevel:update(dt)
end