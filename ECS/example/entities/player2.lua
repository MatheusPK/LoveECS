Player2 = ECS.entity:new()

Player2:addComponent(ECS.component:new(COMPONENTS.TRANSFORM, {x = 50, y = 300, w = 50, h = 50}))
Player2:addComponent(ECS.component:new(COMPONENTS.INPUT, {keys = {"up", "left", "down", "right"}}))
Player2:addComponent(ECS.component:new(COMPONENTS.SPEED, {xSpeed = 100, ySpeed = 100}))
