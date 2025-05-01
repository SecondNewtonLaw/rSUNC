--[=[
    Provides functions to collect and modify information of the Luau callstack and Luau functions.

    @class debug
    @tag Library
]=]
local debug = {}

--[=[
    Gets the number of up-values/ up-references of the given function or call-stack index `fnOrIndex`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get the number of up-values.
    @return number -- The number of up-values this function/ stack index holds.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.
]=]
function debug.getupvaluecount<T..., U...>(fnOrIndex: number | (T...) -> U...): number
    return nil :: any
end

--[=[
    Gets the number of constants of the luau function or call-stack index `fnOrIndex`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get the number of constants.
    @return number -- The number of constants this function/ stack index holds.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::warning C closures
    C closures do not have constants.
    :::
]=]
function debug.getconstantcount<T..., U...>(fnOrIndex: number | (T...) -> U...): number
    return nil :: any
end

--[=[
    Gets all of the constants of the luau function or call-stack index `fnOrIndex`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get all constants.
    @return { any } -- All constants this function/ stack index holds.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::warning C closures
    C closures do not have constants.
    :::
]=]
function debug.getconstants<T..., U...>(fnOrIndex: number | (T...) -> U...): { any }
    return nil :: any
end

--[=[
    Gets the constant of the luau function or call-stack index `fnOrIndex` at the given constant `index`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get.
    @param index number -- The numerical index of the constant to get.
    @return any -- The constant at the given index.
    @error invalid constant index -- The index must be non-negative, more than 0 and smaller than the number of constants the closure has. Use debug.getconstantcount to get the number of constants before calling this function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::warning C closures
    C closures do not have constants.
    :::
]=]
function debug.getconstant<T..., U...>(fnOrIndex: number | (T...) -> U..., index: number): any
    return nil :: any
end

--[=[
    Sets the constant of the luau function or call-stack index `fnOrIndex` at the given constant `index` to `newValue`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to set.
    @param index number -- The numerical index of the constant to set.
    @param newValue any -- The new constant to set.
    @error the type of the new value that of the original -- Whatever is at index index does not match with the type of newValue. For userdatas, their tags must also match.
    @error invalid constant index -- The index must be non-negative, more than 0 and smaller than the number of constants the closure has. Use debug.getconstantcount to get the number of constants before calling this function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::warning Vector objects
    Luau can have Vector objects as constants. Due to this, you must set the `extra` field on the `lua_TValue` structure correctly!
    :::

    :::warning C closures
    C closures do not have constants.
    :::
]=]
function debug.setconstant<T..., U...>(fnOrIndex: number | (T...) -> U..., index: number, newValue: any) end

--[=[
    Gets all of the up-value/ up-references of the given function or call-stack index `fnOrIndex`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get all up-values/ up-references.
    @return { any } -- All up-values/up-reference this function/ stack index holds.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::danger C closures
    You must NEVER allow the mutation of the up-values of C closures! C closures are specific on their constraints.
    :::
]=]
function debug.getupvalues<T..., U...>(fnOrIndex: number | (T...) -> U...): { any }
    return nil :: any
end

--[=[
    Gets the up-value or up-reference of the given function or call-stack index `fnOrIndex` at the given up-reference/up-value `index`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to get.
    @param upIndex number -- The numerical index of the up-reference/up-value to get.
    @return any -- The up-reference/up-value at the given index.
    @error invalid upvalue index -- The index must be non-negative, more than 0 and smaller than the number of upvalues the closure has. Use debug.getupvaluecount to get the number of upvalues before calling this function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::danger C closures
    You must NEVER allow the mutation of the up-values of C closures! C closures are specific on their constraints.
    :::
]=]
function debug.getupvalue<T..., U...>(fnOrIndex: number | (T...) -> U..., upIndex: number): any
    return nil :: any
end

--[=[
    Sets the up-value or up-reference of the given function or call-stack index `fnOrIndex` at the given up-reference/up-value `index` to `value`.

    @within debug
    @param fnOrIndex number | (T...) -> U... -- The function or call-stack index to set.
    @param upIndex number -- The numerical index of the up-reference/up-value to set.
    @param newValue any -- The new up-reference/up-value to set.
    @error the type of the new value that of the original -- Whatever is at index upIndex does not match with the type of newValue. For userdatas, their tags must also match.
    @error invalid upvalue index -- The index must be non-negative, more than 0 and smaller than the number of upvalues the closure has. Use debug.getupvaluecount to get the number of upvalues before calling this function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::danger C closures
    You must NEVER allow the mutation of the up-values of C closures! C closures are specific on their constraints.
    :::
]=]
function debug.setupvalue<T..., U...>(fnOrIndex: number | (T...) -> U..., upIndex: number, newValue: any) end

--[=[
    Sets the stack element at index `stackIndex` at call-stack level `level` to `newStackElement`.

    @within debug
    @param level number -- The level to set.
    @param stackIndex number -- The numerical index in the stack to set.
    @param newStackElement any -- The new stack element to set.
    @error the type of the new value that of the original -- Whatever is at element stackIndex does not match with the type of newStackElement. For userdatas, their tags must also match.
    @error invalid stack index -- The index must be non-negative, more than 0 and smaller than the size of the stack. Use debug.getstackcount to get the number of upvalues before calling this function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.

    :::danger C closures
    You must NEVER allow the mutation of the stacks of C closures! This is related to vulnerabilities.
    :::

]=]
function debug.setstack(level: number, stackIndex: number, newStackElement: any) end

--[=[
    Returns the stack element at index `stackIndex` at call-stack level `level`.
    If no `stackIndex` is provided, the entire stack will be returned.

    @within debug
    @param level number -- The level to get.
    @param stackIndex number? -- The numerical index in the stack to get, or nil to get the entire stack.
    @return any | { any } -- The stack element at the given index, or the entire stack.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.
]=]
function debug.getstack(level: number, stackIndex: number?): any | { any }
    return nil
end

--[=[
    Returns the number of elements on the luau stack at the provided call-stack `level`.

    @within debug
    @param level number -- The level to get.
    @return number -- The number of elements on the luau stack.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.
]=]
function debug.getstackcount(level: number): number
    return nil :: any
end

--[=[
    Returns if the given call-stack level is a valid level.

    @within debug
    @param level number -- The level to check.
    @return boolean -- If true, the level is valid and can be used on call functions.
]=]
function debug.validlevel(level: number): boolean
    return nil :: any
end

--[=[
    identical to `debug.traceback`

    @within debug
    @param threadOrMessage string | thread -- The first line of the returned string.
    @param levelOrMessage number | string -- The number of calls "up" the call stack to return.
    @param level number?

    @return string -- The traceback up to the given level from the current function.

    :::info Function Behaviour
    This function skips over C closures.
    :::
]=]
function debug.traceback(threadOrMessage: string | thread, levelOrMessage: number | string, level: number?): string
    return nil :: any
end

--[=[
    Identical to `debug.info`

    @within debug
    @param level number | (T...) -> U... -- The level/ function to get the information from.
    @param what string -- The information to get.
    @return K... | nil -- Information on the order of 'what', may be nil.

]=]
function debug.info<T..., U..., K...>(
    levelOrThreadOrFunction: number | thread | (T...) -> U...,
    whatOrLevelOrFunction: number | string | (T...) -> U...,
    what: string?
): K...
end

--[=[
    Returns information about the function that is currently using the given stack frame or of a given function.

    @within debug
    @param level number | (T...) -> U... -- The level/ function to get the information from.
    @return DebugInfo -- The information about the function that is currently using the given stack frame or of a given function.
    @error level out of range -- The provided stack level was out of range. use debug.validlevel to check if the level is valid before calling this function.
]=]
function debug.getinfo<T..., U...>(level: number | (T...) -> U...): DebugInfo end

return debug
