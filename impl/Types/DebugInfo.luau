--[=[
    Contains information about the function that is currently using the given stack frame or of a given function.

    @class DebugInfo
    @tag Type
]=]

--[=[
    @prop func (T...) -> U...
    @within DebugInfo

    The function that is currently using the stack frame/ provided function.
]=]

--[=[
    @prop source string
    @within DebugInfo

    The chunkName of the function that is currently using the stack frame/ provided function.

    :::warning
    This property only holds useful information if the function is a Luau function, else it will contain `=[C]`.
    :::
]=]

--[=[
    @prop short_src string
    @within DebugInfo

    A shortened version of the chunkName of the function that is currently using the stack frame/ provided function.

    :::warning
    This property only holds useful information if the function is a Luau function, else it will contain `[C]`.
    :::
]=]

--[=[
    @prop currentline number
    @within DebugInfo

    The current line number of the function that is currently using the stack frame/ provided function.


    :::warning
    This property only holds useful information if the function is a Luau function, else it will contain `-1`.
    :::
]=]

--[=[
    @prop name string
    @within DebugInfo

    The debugname of the function that is currently using the stack frame/ provided function is at.
]=]

--[=[
    @prop what "Lua" | "C"
    @within DebugInfo

    The debugname of the function that is currently using the stack frame/ provided function is at.

    :::tip Usage
    If your executor somehow messed up on `islclosure` or `iscclosure`, you can use this field to check the type of function you have.
    :::
]=]

--[=[
    @prop nups number
    @within DebugInfo

    The number of upvalues used by the function that is currently using the stack frame/ provided function.
]=]

--[=[
    @prop numparams number
    @within DebugInfo

    The number of parameters used by the function that is currently using the stack frame/ provided function.

    :::warning
    This property only holds useful information if the function is a Luau function, else it will contain `0`.
    :::
]=]

--[=[
    @prop is_vararg boolean
    @within DebugInfo

    If the function that is currently using the stack frame/ provided function is a vararg function.

    :::warning
    This property only holds useful information if the function is a Luau function, else it will contain `true`.
    :::
]=]

return {}
