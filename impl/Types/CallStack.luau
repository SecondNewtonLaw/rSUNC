--[=[
    Contains a brief callstack, without any stack variables, only the current line and the function. 
    @class CallStack
    @tag Type
]=]
local CallStack = {}

--[=[
    The line at which the 'call' to the following callstack will be performed.

    @prop currentline number
    @within CallStack
]=]
CallStack.currentline = 0

--[=[
    The function that this function is a callstack of.

    @prop func (T...) -> U...
    @within CallStack
]=]
CallStack.func = function() end
