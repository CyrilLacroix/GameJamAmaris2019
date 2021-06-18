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
    if self.currentScreen.title ~=  "Home Screen" then
        self.currentScreen = HomeScreen:new()
        self.currentScreen:load()
    end
end

function ScreenManager:goToGameScreen (dt)
    if self.currentScreen.title ~=  "Game Screen" then
        self.currentScreen = GameScreen:new()
        self.currentScreen:load()
    end
end