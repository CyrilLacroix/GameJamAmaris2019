require("GameEngine.Entities.Player")
require("GameEngine.Entities.Cloud")
Level1 = {}

function Level1:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.mountain = nil
    self.mountainX = 0
    self.clouds = {}
    self.CurrentPlayer = Player:new()
    return o
end

function Level1:load ()
    self.mountain = love.graphics.newImage("Content/mountain.png")
    cloud1 = Cloud:new()
    table.insert(self.clouds, cloud1)
    for i=1, table.getn(self.clouds) do
        self.clouds[i]:load(100, 50)
    end
    self.CurrentPlayer:load()

end

function Level1:draw ()
    -- Sky
    love.graphics.setColor(83/255, 144/255, 217/255)
    love.graphics.rectangle("fill", 0, 0, 1280, 660 )

    -- Clouds
    for i=1, table.getn(self.clouds) do
        self.clouds[i]:draw()
    end
    love.graphics.setColor( 1, 1, 1, 1 )

    love.graphics.print("clouds: ".. table.getn(self.clouds), 0, 10)


    -- Background 1
    love.graphics.setColor( 1, 1, 1, 1 )
    love.graphics.draw(self.mountain, self.mountainX, 200, 0, 2, 2)

    -- Ground
    love.graphics.setColor(255/255, 232/255, 214/255)
    love.graphics.rectangle("fill", 0, 660, 1280, 100 )
    love.graphics.setColor( 1, 1, 1, 1 )
    self.CurrentPlayer:draw()
end

function Level1:update (dt)
    for i=1, table.getn(self.clouds) do
        self.clouds[i]:update()
    end
    self.CurrentPlayer:update(dt)
    if love.keyboard.isDown("d") then 
       self.mountainX = self.mountainX - 0.1
    end
    if love.keyboard.isDown("a") then 
        self.mountainX = self.mountainX + 0.1
    end
end