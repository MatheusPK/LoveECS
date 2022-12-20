Player = ECS.entity:new()

Player:addComponent(ECS.component:new(COMPONENTS.TRANSFORM, {x = 50, y = 100, w = 50, h = 50}))
Player:addComponent(ECS.component:new(COMPONENTS.INPUT, {keys = {"w","a","s","d"}}))
Player:addComponent(ECS.component:new(COMPONENTS.SPEED, {xSpeed = 100, ySpeed = 100}))