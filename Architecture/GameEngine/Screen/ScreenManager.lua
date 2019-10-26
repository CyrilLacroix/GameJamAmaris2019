require("GameEngine.Screen.GameScreen")
require("GameEngine.Screen.HomeScreen")
ScreenManager = {}

function ScreenManager:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.currentScreen = HomeScreen:new()
    return o
end

function ScreenManager:load ()
end

function ScreenManager:draw ()
    self.currentScreen:draw()
end

function ScreenManager:update (dt)
    self.currentScreen:update(dt)
end


-- Actions
function ScreenManager:goToHomeScreen (dt)
    self.currentScreen = HomeScreen:new()
end

function ScreenManager:goToGameScreen (dt)
    self.currentScreen = GameScreen:new()
end