---
---  空状态，在改状态下可跳转到任何状态
---

local M = {}

function M:new(...)
    self.__index = self
    local ret = setmetatable({},self)
    ret:init(...)
    return ret
end

function M:init(state,transitionTable,onEnterCallBack,onLeaveCallBack)
    self.State = state                                      -- 状态值
    self.Transition = transitionTable or {}                 -- 可迁移状态表
    self.onEnter = onEnterCallBack                          -- 进入时调用
    self.onLeave = onLeaveCallBack                          -- 离开时操作
end

--[[--
    进入状态时的操作
]]
function M:DoEnter()
    if self.onEnter then
        self.onEnter(self.State)
    end
end

--[[--
    离开该状态时的操作
]]
function M:DoLeave()
    if self.onLeave then
        self.onLeave(self.State)
    end
end

--[[--
    是否可切换到指定状态
]]
function M:Can(state)
    return true
end
return M