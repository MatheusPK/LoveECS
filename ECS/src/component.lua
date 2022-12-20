local component = {
    type = nil,
    value = nil
}

function component:new(type, value)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.type = type or "UNDEFINED"
    o.value = value
    return o
end

return component