Player = ECS.entity:new()

Player:addComponent(ECS.component:new(COMPONENTS.TRANSFORM, {x = 50, y = 100, w = 50, h = 50}))

return Player