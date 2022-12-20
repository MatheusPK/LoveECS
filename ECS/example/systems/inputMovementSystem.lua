InputMovementSystem = ECS.system:new(World, {
    COMPONENTS.INPUT,
    COMPONENTS.SPEED,
    COMPONENTS.TRANSFORM
})

function InputMovementSystem:process(dt, componentSet)
    for _, components in ipairs(componentSet) do
        local inputComponent = components[COMPONENTS.INPUT].value
        local transformComponent = components[COMPONENTS.TRANSFORM].value
        local speedComponent = components[COMPONENTS.SPEED].value
        local keys = inputComponent.keys

        if keys.w or keys.up then  transformComponent.y = transformComponent.y - speedComponent.ySpeed * dt end
        if keys.a or keys.left then  transformComponent.x = transformComponent.x - speedComponent.xSpeed * dt end
        if keys.s or keys.down then  transformComponent.y = transformComponent.y + speedComponent.ySpeed * dt end
        if keys.d or keys.right then  transformComponent.x = transformComponent.x + speedComponent.xSpeed * dt end
    end
end