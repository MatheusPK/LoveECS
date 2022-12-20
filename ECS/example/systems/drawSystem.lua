DrawSystem = ECS.system:new(World, {
    COMPONENTS.TRANSFORM
})

function DrawSystem:process(dt, componentSet)
    for _, components in ipairs(componentSet) do
        local transform = components[COMPONENTS.TRANSFORM].value
        love.graphics.setColor(1,0,0,1)
        love.graphics.rectangle("fill", transform.x, transform.y, transform.w, transform.h)
    end
end