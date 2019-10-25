Fps = {}

deltaTime = 0
fps = 0
fpsCount = 0

function Fps:draw()
    love.graphics.print(string.format("FPS: %s",fps), 0, 0)
end

function Fps:update(dt)
    if deltaTime < 1 then
        fpsCount = fpsCount + 1
        deltaTime = deltaTime + dt
    else
        fps = fpsCount
        fpsCount = 0
        deltaTime = dt
    end
end