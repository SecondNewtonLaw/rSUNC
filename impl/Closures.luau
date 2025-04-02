--!strict

--[=[
	@class Closures
	Contains functions which interact and modify closures and their behaviour.
]=]
local closures = {}

--[=[
    Wraps the given closure into a upvalue-less C closure.

    @within Closures
    @param fn (T...) -> U... -- Function to wrap
    @param debugName string? -- The name of the function, optional.
    @return (T...) -> U...
]=]
function closures.newcclosure<T..., U...>(fn: (T...) -> U..., debugName: string?): (T...) -> U...
    return nil :: any
end

--[=[
    Wraps the given closure into a upvalue-less L closure.

    @within Closures
    @param fn (T...) -> U... -- Function to wrap
    @return (T...) -> U... -- 

    :::info Obfuscators
    Obfuscators like Luraph:tm: use the function environment to wrap closures and bypass upvalue limits. Make sure that the environment of the pushed wrapper proxies the environment of the original function using `__index`. This should fix issues relating to Luraph:tm: not working with this function.
    :::

    :::warning
    This function, depending on the implementation, may rely on function environments to work or in a closure map-backed proxy function (like in newcclosure). Beware of this when using the function.
    :::
]=]
function closures.newlclosure<T..., U...>(fn: (T...) -> U...): (T...) -> U...
    return nil :: any
end

--[=[
	Hooks the given function with the desired hook.

	@within Closures
	@param fn (T1...) -> U1... -- Function to hook.
	@param hook (T2...) -> U2... -- The hook.
	@return (T1...) -> U1... -- The old/original function.

]=]

function closures.hookfunction<T1..., U1..., T2..., U2...>(fn: (T1...) -> U1..., hook: (T2...) -> U2...): (T1...) ->U1...
	return nil :: any
end

return closures
