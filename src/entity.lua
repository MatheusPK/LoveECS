local utils = require('utils')

local entity = {
    components = {},
    archetype = {}
}

function entity:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function entity:addComponent(component)
    self.components[component.type] = component
    self:addType(component)
end

function entity:updateComponent(componentType, newValue)
    self.components[componentType].value = newValue
end

function entity:removeComponent(componentType)
    self.components[componentType] = nil
    self:removeType(componentType)
end

function entity:getComponent(componentType)
    return self.components[componentType]
end

-- MARK: - Private Functions
function entity:addType(componentType)
    table.insert(self.archetype, componentType)
    self.archetype[componentType] = #self.archetype
end

function entity:removeType(componentType)
    local lastTypeIndex = #self.archetype
    local lastType = self.archetype[lastTypeIndex]
    local typeToRemove = self.archetype[componentType]
    utils:swap(self.archetype, typeToRemove, lastType)
    table.remove(self.archetype, lastTypeIndex)
end

return entity