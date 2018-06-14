---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by liruijun.
--- DateTime: 2018/6/14 10:42
---

local M = {}

function M:new(...)
    self.__index = self
    local ret = setmetatable({},self)
    ret:init(...)
    return ret
end
function M:init()
    self.StateTable = {}        -- 状态表
    self.CurState = nil         -- 当前状态
end

--[[--
    增加一个状态
]]
function M:AddState(state)
    if not self.StateTable[state.State] then
        self.StateTable[state.State] = state
    end
end

--[[--
    删除一个状态
]]
function M:DeleteState(state)
    if self.StateTable[state.State] then
        self.StateTable[state.State] = nil
    end
end

--[[--
    切换状态
]]
function M:TranslateState(state)
    if not self.StateTable[state] then
        print(string.format("Error : State %s not exist state table",state))
        return
    end
    if nil == self.CurState then
        self.StateTable[state]:DoEnter()
        self.CurState = state
        return
    end
    if self.StateTable[self.CurState]:Can(state) then
        self.StateTable[self.CurState]:DoLeave()
        self.StateTable[state]:DoEnter()
        self.CurState = state
    else
        print(string.format("Error : Can't Translate %s  to %s ",self.CurState,state))
    end

end

--[[--
    当前状态
]]
function M:CurrentState()
    return self.CurState
end
return M