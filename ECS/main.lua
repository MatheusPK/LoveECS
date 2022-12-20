ECS = require('src.ecs')
World = ECS.world:new()
require('example.shared.imports')

function love.load()
    World:addEntity(Player)
    World:setDrawSystem(DrawSystem)
end

function love.update(dt)
    World:update(dt)
end

function love.draw()
    World:draw()
end