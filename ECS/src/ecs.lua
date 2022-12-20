local _world = require('src.world')
local _entity = require('src.entity')
local _component = require('src.component')
local _system = require('src.system')

local ecs = {
    world = _world,
    entity = _entity,
    component = _component,
    system = _system
}

return ecs