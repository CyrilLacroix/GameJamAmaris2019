require("GameEngine.Screen.ScreenManager")

ScreenManager = ScreenManager:new()

function love.load ()
    love.window.setMode(1280, 760)
end

function love.draw ()
    ScreenManager:draw()
end

function love.update (dt)
    ScreenManager:update(dt)
    if love.keyboard.isDown("1") then ScreenManager:goToGameScreen() end
    if love.keyboard.isDown("2") then ScreenManager:goToHomeScreen() end
end