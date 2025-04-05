--!strict

--[=[
    Contains functions which interact and modify closures and their behaviour.
    @class closures
    @tag Library
]=]
local closures = {}

--[=[
	Provides a hash with a digest size of 48 (384 bits) in hex format for the given function

	@within closures
	@param fn (T...) -> U... -- The function to hash.
	@param hash "SHA384" | "BLAKE2B" | "BLAKE3" -- The hash type, defaults to SHA384.
	@return string -- The hex representation of the Blake2B hash of the function.
	

	:::info Implementation
	You must use the instructions and constants of the given function to obtain the hash.
	:::

	@error function must be a Luau closure. -- The first parameter was a C function instead of a Luau function.
	@error Unsupported hash type. -- The given hash type is not supported by the executor.
]=]
function closures.getfunctionhash<T..., U...>(fn: (T...) -> U..., hash: "SHA384" | "BLAKE2B" | "BLAKE3"): string
	return nil :: any
end

--[=[
	Hooks the given function with the desired hook. This function supports hooking all kinds of closures, from Lua to C, C to Lua, etc.

	@within closures
	@param fn (T...) -> U... -- Function to hook.
	@param hook (T...) -> U... -- The hook.
	@return (T...) -> U... -- The old/original function.
	@error Too many upvalues! -- The function to hook has more upvalues than the function you want to hook it with. (This error may not show on some implementations.)
	@error this function cannot be hooked from Luau -- The function has been marked as unhookable by `makeunhookable` or by native executor code.

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
	local original = closures.hookfunction(a, b) -- If this call fails, consider implcitly wrapping `b` in a newlclosure!

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

	local old; old = closures.hookfunction(coroutine.resume, dummyFunc) -- Hook C -> L. This test also checks that hookfunction can bypass upvalue limits.
	coroutine.resume("Hello")
	
	if not upref then
		AsCon(4<3, "hookfunction", "Failed to hook C -> L Closures")
	end
	
	upref = false
	closures.hookfunction(coroutine.resume, old)
	pcall(coroutine.resume, "Hello")
	```
]=]
function closures.hookfunction<T..., U...>(fn: (T...) -> U..., hook: (T...) -> U...): (T...) -> U...
	return nil :: any
end

--[=[
	Restores any hooks done to `restoreWhat`, regardless of the hook type (i.e., C closure hook, Luau closure hook, ...) and of how many hooks were done to `restoreWhat`.

	@param restoreWhat (T...) -> U... -- The function that should be restored.
	@error function is not hooked -- The function is not hooked, and thus cannot be restored. Use `ishooked` before calling this function!
]=]
function closures.restorefunction<T..., U...>(restoreWhat: (T...) -> U...): () end

--[=[
	Compiles and loads the given `luauCode`. If `chunkName` is not provided, it must default to either: a pseudo-randomly generated string, or `=loadstring`.

	Loadstring must compile the code with the following compile configuration:
		- Optimization Level 1
		- Debug Level 1

	The function must also mark the environment as 'unsafe' to disable environment optimizations as per Luau specifications. 

	@within closures
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
	Wraps the given closure into a upvalue-less C closure.

	@within closures
	@param fn (T...) -> U... -- Function to wrap
	@param debugName string? -- The name of the function, optional.
	@return (T...) -> U...
]=]
function closures.newcclosure<T..., U...>(fn: (T...) -> U..., debugName: string?): (T...) -> U...
	return nil :: any
end

--[=[
	Wraps the given closure into a upvalue-less L closure.

	@within closures
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
	Wraps the given closure into an upvalue-less version of itself.

	@within closures
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
	Checks if the given function is an executor closure.

	@within closures
	@param fn (T...) -> U... -- The function to check.
	@return boolean -- Whether the function is an executor closure.

	:::info Implementation
	The function may use any method, as long as it returns true for executor Luau and C functions, as well as hooked functions, and false for any non-executor functions. This means that functions retrieved from loadstring or getscriptclosure will also return true.
	:::
]=]
function closures.isexecutorclosure<T..., U...>(fn: (T...) -> U...): boolean
	return nil :: any
end

--[=[
	Clones the given function, providing a unique copy of it that is completely unrelated to `fn`.

	@within closures
	@param fn (T...) -> U... -- The function to clone.
	@return (T...) -> U... -- A clone of the function.

	:::danger Obfuscator Support
	You must note that a cloned Luau function must have the SAME environment as the original function. If you do not provide an environment and an obfuscator depends on it for upvalues, you may face script errors.
		
	This has been documented behaviour on scripts obfuscated by obfuscators such as Luraph, where `newlclosure` and/or `clonefunction` do not properly set the environment of the cloned function, which causes script errors.
	:::
]=]
function closures.clonefunction<T..., U...>(fn: (T...) -> U...): (T...) -> U...
	return nil :: any
end

--[=[
	Returns if the given function can be hooked.

	@within closures
	@param fn (T...) -> U... -- The function to check.
	@return boolean -- Whether the function can be hooked.

	:::tip Whitelists
	You can use this function if your executor abides by rSUNC to determine if the environment is proper for your whitelist.
	:::
]=]
function closures.isunhookable<T..., U...>(fn: (T...) -> U...): boolean
	return nil :: any
end

--[=[
	Returns if the given function has been hooked.

	@within closures
	@param fn (T...) -> U... -- The function to check.
	@return boolean -- Whether the function has been hooked.

	:::tip Whitelists
	You can use this function if your executor abides by rSUNC to determine if the environment is proper for your whitelist.
	:::
]=]
function closures.ishooked<T..., U...>(fn: (T...) -> U...): boolean
	return nil :: any
end

--[=[
	Makes a function unable to be hooked. This function automatically reverts ANY hooks placed on the function if there are any set.

	@within closures
	@param fn (T...) -> U... -- The function to make unhookable and remove all hooks of.

]=]
function closures.makeunhookable<T..., U...>(fn: (T...) -> U...): () end

return closures
