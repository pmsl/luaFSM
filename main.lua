local FSM = require(".Fsm/FSM")
local Empty = require(".Fsm/EmptyState")
local State = require(".Fsm/FSMState")


local SState = {
    EMPTY = 0,
    STATE1 = 1,
    STATE2 = 2,
    STATE3 = 3,
}
local fsm = FSM:new()

function doEnter(state)
    print(string.format("Enter: State [%s]",state))
end

function doLeave(state)
    print(string.format("Leave: State [%s]",state))
end

fsm:AddState(Empty:new(SState.EMPTY,nil,doEnter,doLeave))
fsm:AddState(State:new(SState.STATE1,{SState.EMPTY},doEnter,doLeave))
fsm:AddState(State:new(SState.STATE2,{SState.EMPTY},doEnter,doLeave))
fsm:AddState(State:new(SState.STATE13,{SState.EMPTY},doEnter,doLeave))



fsm:TranslateState(SState.EMPTY)
fsm:TranslateState(SState.STATE1)
fsm:TranslateState(SState.STATE2)