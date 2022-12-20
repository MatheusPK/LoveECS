InputSystem = ECS.system:new(World, {
    COMPONENTS.INPUT
})

function InputSystem:process(dt, componentSet)
    for _, components in ipairs(componentSet) do
        local inputComponent = components[COMPONENTS.INPUT].value
        local keys = inputComponent.keys
        for _, key in ipairs(keys) do
            keys[key] = love.keyboard.isDown(key)
        end
    end
end