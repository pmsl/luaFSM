# luaFSM
```
local FSM = require(".Fsm/FSM")
local Empty = require(".Fsm/EmptyState")
local State = require(".Fsm/FSMState")


local SState = {
    EMPTY = 0,			-- 空状态 - 可切换到任意状态
    STATE1 = 1,			-- 状态1
    STATE2 = 2,			-- 状态2
    STATE3 = 3,			-- 状态3
}
local fsm = FSM:new()	 -- 创建状态机

function doEnter(state)
    print(string.format("Enter: State [%s]",state))
end

function doLeave(state)
    print(string.format("Leave: State [%s]",state))
end

fsm:AddState(Empty:new(SState.EMPTY,nil,doEnter,doLeave))		-- 添加空状态
fsm:AddState(State:new(SState.STATE1,{SState.EMPTY},doEnter,doLeave))	-- 添加状态 1
fsm:AddState(State:new(SState.STATE2,{SState.EMPTY},doEnter,doLeave))
fsm:AddState(State:new(SState.STATE13,{SState.EMPTY},doEnter,doLeave))



fsm:TranslateState(SState.EMPTY)
fsm:TranslateState(SState.STATE1)
fsm:TranslateState(SState.STATE2)
```

