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
	Hooks the given function with the desired hook. This function supports hooking all kinds of closures, from Lua to C, C to Lua, etc.

	@within Closures
	@param fn (T...) -> U... -- Function to hook.
	@param hook (T...) -> U... -- The hook.
	@return (T...) -> U... -- The old/original function.
	@error Too many upvalues! -- The function to hook has more upvalues than the function you want to hook it with. (This error may not show on some implementations.)

	:::info Implementations
	Some implementations of this function may bypass upvalue limits for you. If this is not the case, wrap `hook` in a `newcclosure`/ `newlclosure` before calling `hookfunction`.
	:::

	:::tip Restoring Hooked Functions
	You can restore functions hooked with `hookfunction` using `restorefunction`, in case `restorefunction` is not available you may unhook by calling `hookfunction` with the first function being the hooked function, and the second being the original one.
	:::

	
	## Examples:

	### Testing hookfunction and restorefunction:
	```lua
	local function a()
		return "baa"
	end
	local function b()
		return "caa"
	end

	local aReturn = a()
	local bReturn = b()
	local hooked = closures.hookfunction(a, b)
	local hookedReturn = hooked()
	assert(hookedReturn == aReturn)
	assert(a() == b() and a() == bReturn)
	assert(hooked ~= a and b ~= a)
	closures.restorefunction(hooked, a) -- Restore a again.
	assert(a() == aReturn and a() ~= hookedReturn)

	-- If this script errors, your hookfunction may not be working properly.
	```

	### Example testing upvalue limits:
	```lua
	local a = "A"
	local b = "B"
	local c = "C"
	local function a() -- Upvalue count: 3
		a = "B"
		b = "C"
		c = "D"
	end

	local function b() -- Upvalue Count: 2
		a = "E"
		b = "F"
	end
	
	a() -- Set variables
	local original = hookfunction(a, b) -- If this call fails, consider implcitly wrapping `b` in a newlclosure!

	a()
	assert(a == "E" and b == "F" and c == "D") -- If this errors, the upvalues are improperly set, and this could lead to a crash!
	assert()
	```

	### Example testing hooking pairs:
	```lua
	local upref = false
	local dummyFunc = function(f)
		upref = f == "Hello"
	end

	local old; old = hookfunction(coroutine.resume, dummyFunc) -- Hook C -> L. This test also checks that hookfunction can bypass upvalue limits.
	coroutine.resume("Hello")
	
	if not upref then
		AsCon(4<3, "hookfunction", "Failed to hook C -> L Closures")
	end
	
	upref = false
	hookfunction(coroutine.resume, old)
	pcall(coroutine.resume, "Hello")
	```
]=]
function closures.hookfunction<T..., U...>(fn: (T...) -> U..., hook: (T...) -> U...): (T...) -> U...
	return nil :: any
end

--[=[
	Wraps the given closure into an upvalue-less version of itself.

	@within Closures
	@param fn (T...) -> U... -- Function to wrap
	@return (T...) -> U... -- A copy of the function, without upvalues.

	:::info 
	This function is a proxy to the correct implementation of `newcclosure`/ `newlclosure`.
	:::

	### Examples:

	```lua
	local b = "b"
	local function a() -- Upvalue Count: 1 ('b')
		b = "a"
	end

	assert(#debug.getupvalues(a) == 1, "debug.getupvalues failure") -- Validate the behaviour of debug.getupvalues.
	assert(#debug.getupvalues(closures.wrapclosure(a)) == 0, "wrapped closure has upreferences/upvalues")
	assert(islclosure(a) == iscclosure(closures.wrapclosure(a)), "closure type-mismatch")

	-- If this script errors, your wrapclosure may not be working properly.
	```
]=]
function closures.wrapclosure<T..., U...>(fn: (T...) -> U...): (T...) -> U...
	return nil :: any
end

--[=[
	Compiles and loads the given `luauCode`. If `chunkName` is not provided, it must default to either: a pseudo-randomly generated string, or `=loadstring`.

	@within Closures
	@param luauCode string -- The code to compile and load.
	@param chunkName string? -- The name of the chunk to load.
	@return ((T...) -> U...) | nil -- The loaded function, if loading succeeded.
	@return string? -- The error message, if loading failed.

	@error N/A -- This function does not explicitly error, however it returns an error message if the code fails to load in the second return.
]=]
function closures.loadstring<T..., U...>(luauCode: string, chunkName: string?): ((T...) -> U... | nil, string?)
	return nil :: any
end

--[=[
	Provides a hash for the given function

	@within Closures
	@param fn (T...) -> U... -- The function to hash.
	@param hashType "Instructions" | "Constants" | "InstructionsAndConstants" -- The hash type to use, defaults to 'InstructionsAndConstants' if left empty.
	@return string -- The hash of the function.

	:::info Implementing Instructions
	You must hash the instructions (code) of the function. This does **not** include natively generated code.
	:::

	:::info Implementing Constants
	You must add all constants into a big string, and hash that.
	i.e.: "`APPA`", "`BCCA`", "`CVVVA`" would be merged into "`APPABCCACVVVA`" and then hashed together to obtain the hash.
	:::

	:::info Implementing InstructionsAndConstants
	You must simply add the hashes of '`Instructions`' and '`Constants`' together, and take the hash of that. 
	:::

	@error Unsupported hash type. -- The given hash type is not supported by the executor.
]=]
function closures.getfunctionhash<T..., U...>(
	fn: (T...) -> U...,
	hashType: "Instructions" | "Constants" | "InstructionsAndConstants"
): string
	return nil :: any
end

return closures
