"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[721],{23182:e=>{e.exports=JSON.parse('{"functions":[{"name":"getfunctionhash","desc":"Provides a hash with a digest size of 48 bytes (384 bits) in hex format for the given function\\n\\n\\n\\n:::info Implementation\\nYou must use the instructions and constants of the given function to obtain the hash.\\n:::\\n\\n:::danger Compiler\\nIf your function is outputting different hashes every time its called, then you may have forgotten to account for Compiler settings. We recommend you read [this post](/docs/CompilerCompliance) to know to resolve this issue and make your Luau compiler rSUNC compliannt.\\n:::","params":[{"name":"fn","desc":"The function to hash.","lua_type":"(T...) -> U..."},{"name":"hashType","desc":"The hash type, defaults to SHA384.","lua_type":"\\"SHA384\\" | \\"BLAKE2B\\" | \\"BLAKE3\\""}],"returns":[{"desc":"The hex representation of the selected hashType hash of the function.","lua_type":"string"}],"function_type":"static","errors":[{"lua_type":"function must be a Luau closure.","desc":"The first parameter was a C function instead of a Luau function."},{"lua_type":"Unsupported hash type.","desc":"The given hash type is not supported by the executor."}],"source":{"line":30,"path":"impl/Libraries/closures.luau"}},{"name":"hookfunction","desc":"Hooks the given function with the desired hook. This function supports hooking all kinds of closures, from Lua to C, C to Lua, etc.\\n\\n\\n:::info Implementations\\nSome implementations of this function may bypass upvalue limits for you. If this is not the case, wrap `hook` in `newcclosure`/`newlclosure` before calling `hookfunction`.\\n:::\\n\\n:::tip Restoring Hooked Functions\\nYou can restore functions hooked with `hookfunction` using `restorefunction`, in case `restorefunction` is not available you may unhook by calling `hookfunction` with the first function being the hooked function, and the second being the original one.\\n:::\\n\\n\\n## Examples:\\n\\n### Testing hookfunction and restorefunction:\\n```lua\\nlocal function a()\\n    return \\"baa\\"\\nend\\nlocal function b()\\n    return \\"caa\\"\\nend\\n\\nlocal aReturn = a()\\nlocal bReturn = b()\\nlocal hooked = closures.hookfunction(a, b)\\nlocal hookedReturn = hooked()\\nassert(hookedReturn == aReturn)\\nassert(a() == b() and a() == bReturn)\\nassert(hooked ~= a and b ~= a)\\nclosures.restorefunction(hooked, a) -- Restore a again.\\nassert(a() == aReturn and a() ~= hookedReturn)\\n\\n-- If this script errors, your hookfunction may not be working properly.\\n```\\n\\n### Example testing upvalue limits:\\n```lua\\nlocal a = \\"A\\"\\nlocal b = \\"B\\"\\nlocal c = \\"C\\"\\nlocal function a() -- Upvalue count: 3\\n    a = \\"B\\"\\n    b = \\"C\\"\\n    c = \\"D\\"\\nend\\n\\nlocal function b() -- Upvalue Count: 2\\n    a = \\"E\\"\\n    b = \\"F\\"\\nend\\n\\na() -- Set variables\\nlocal original = closures.hookfunction(a, b) -- If this call fails, consider implicitly wrapping `b` in a newlclosure!\\n\\na()\\nassert(a == \\"E\\" and b == \\"F\\" and c == \\"D\\") -- If this errors, the upvalues are improperly set, and this could lead to a crash!\\nassert()\\n```\\n\\n### Example testing hooking pairs:\\n```lua\\nlocal upref = false\\nlocal dummyFunc = function(f)\\n    upref = f == \\"Hello\\"\\nend\\n\\nlocal old; old = closures.hookfunction(coroutine.resume, dummyFunc) -- Hook C -> L. This test also checks that hookfunction can bypass upvalue limits.\\ncoroutine.resume(\\"Hello\\")\\n\\nif not upref then\\n    error(\\"hookfunction\\", \\"Failed to hook C -> L Closures\\")\\nend\\n\\nupref = false\\nclosures.hookfunction(coroutine.resume, old)\\npcall(coroutine.resume, \\"Hello\\")\\n```","params":[{"name":"fn","desc":"Function to hook.","lua_type":"(T...) -> U..."},{"name":"hook","desc":"The hook.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"The old/original function.","lua_type":"(T...) -> U..."}],"function_type":"static","errors":[{"lua_type":"Too many upvalues!","desc":"The function to hook has more upvalues than the function you want to hook it with. (This error may not show on some implementations.)"},{"lua_type":"This function cannot be hooked from Luau","desc":"The function has been marked as unhookable by `protectfunction` or by native executor code."}],"source":{"line":120,"path":"impl/Libraries/closures.luau"}},{"name":"restorefunction","desc":"Restores any hooks done to `restoreWhat`, regardless of the hook type (i.e., C closure hook, Luau closure hook, ...) and of how many hooks were done to `restoreWhat`.","params":[{"name":"restoreWhat","desc":"The function that should be restored.","lua_type":"(T...) -> U..."}],"returns":[],"function_type":"static","errors":[{"lua_type":"Function is not hooked","desc":"The function is not hooked, and thus cannot be restored. Use `ishooked` before calling this function!"}],"source":{"line":130,"path":"impl/Libraries/closures.luau"}},{"name":"loadstring","desc":"Compiles and loads the given `luauCode`. If `chunkName` is not provided, it must default to either: a pseudo-randomly generated string, or `=loadstring`.\\n\\nLoadstring must compile the code with the following compile configuration:\\n    - Optimization Level 1\\n    - Debug Level 1\\n\\nThe function must also mark the environment as \'unsafe\' to disable environment optimizations as per Luau specifications. ","params":[{"name":"luauCode","desc":"The code to compile and load.","lua_type":"string"},{"name":"chunkName","desc":"The name of the chunk to load.","lua_type":"string?"}],"returns":[{"desc":"The loaded function, if loading succeeded.","lua_type":"((T...) -> U...) | nil"},{"desc":"The error message, if loading failed.","lua_type":"string?"}],"function_type":"static","errors":[{"lua_type":"N/A","desc":"This function does not explicitly error, however it returns an error message if the code fails to load in the second return."}],"source":{"line":149,"path":"impl/Libraries/closures.luau"}},{"name":"newcclosure","desc":"Wraps the given closure into a upvalue-less C closure.","params":[{"name":"fn","desc":"Function to wrap","lua_type":"(T...) -> U..."},{"name":"debugName","desc":"The name of the function, optional.","lua_type":"string?"}],"returns":[{"desc":"","lua_type":"(T...) -> U..."}],"function_type":"static","source":{"line":161,"path":"impl/Libraries/closures.luau"}},{"name":"newlclosure","desc":"Wraps the given closure into a upvalue-less L closure.\\n\\n\\n:::info Obfuscators\\nObfuscators like Luraph\u2122 use the function environment to wrap closures and bypass upvalue limits. Make sure that the environment of the pushed wrapper proxies the environment of the original function using `__index`. This should fix issues relating to Luraph\u2122 not working with this function.\\n:::\\n\\n:::warning\\nThis function, depending on the implementation, may rely on function environments to work or in a closure map-backed proxy function (like in newcclosure). Beware of this when using the function.\\n:::\\n\\n#### Example Implementation (In Luau)\\n```lua\\nlocal function newlclosure<T..., U...>(f: (T...) -> U...): (T...) -> U...\\n    local env = getfenv(f) -- Get environment (env of f gets deoptimized)\\n    local x = setmetatable({\\n        __F = f, -- Store function on environment (prevents upreference)\\n    }, {\\n        __index = env, -- proxy original fenv for obfuscator support\\n        __newindex = env, -- proxy original fenv for obfuscator support\\n    })\\n\\n    local nf = function(...)\\n        return __F(...)  -- proxy call\\n    end\\n    setfenv(nf, x) -- set func env (env of nf gets deoptimized)\\n    return nf\\nend\\n```","params":[{"name":"fn","desc":"Function to wrap","lua_type":"(T...) -> U..."}],"returns":[{"desc":"","lua_type":"(T...) -> U..."}],"function_type":"static","source":{"line":199,"path":"impl/Libraries/closures.luau"}},{"name":"wrapclosure","desc":"Wraps the given closure into an upvalue-less version of itself.\\n\\n\\n:::info \\nThis function is a proxy to the correct implementation of `newcclosure`/ `newlclosure`.\\n:::\\n\\n### Examples:\\n\\n```lua\\nlocal b = \\"b\\"\\nlocal function a() -- Upvalue Count: 1 (\'b\')\\n    b = \\"a\\"\\nend\\n\\nassert(#debug.getupvalues(a) == 1, \\"debug.getupvalues failure\\") -- Validate the behaviour of debug.getupvalues.\\nassert(#debug.getupvalues(closures.wrapclosure(a)) == 0, \\"wrapped closure has upreferences/upvalues\\")\\nassert(islclosure(a) == iscclosure(closures.wrapclosure(a)), \\"closure type mismatch\\")\\n\\n-- If this script errors, your wrapclosure may not be working properly.\\n```","params":[{"name":"fn","desc":"Function to wrap","lua_type":"(T...) -> U..."}],"returns":[{"desc":"A copy of the function, without upvalues.","lua_type":"(T...) -> U..."}],"function_type":"static","source":{"line":229,"path":"impl/Libraries/closures.luau"}},{"name":"isexecutorclosure","desc":"Checks if the given function is an executor closure.\\n\\n\\n:::info Implementation\\nThe function may use any method, as long as it returns true for executor Luau and C functions, as well as hooked functions, and false for any non-executor functions. This means that functions retrieved from loadstring or getscriptclosure will also return true.\\n:::","params":[{"name":"fn","desc":"The function to check.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"Whether the function is an executor closure.","lua_type":"boolean"}],"function_type":"static","source":{"line":244,"path":"impl/Libraries/closures.luau"}},{"name":"clonefunction","desc":"Clones the given function, providing a unique copy of it that is completely unrelated to `fn`.\\n\\n\\n:::danger Obfuscator Support\\nYou must note that a cloned Luau function must have the SAME environment as the original function. If you do not provide an environment and an obfuscator depends on it for upvalues, you may face script errors.\\n    \\nThis has been documented behaviour on scripts obfuscated by obfuscators such as Luraph, where `newlclosure` and/or `clonefunction` do not properly set the environment of the cloned function, which causes script errors.\\n:::","params":[{"name":"fn","desc":"The function to clone.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"A clone of the function.","lua_type":"(T...) -> U..."}],"function_type":"static","source":{"line":261,"path":"impl/Libraries/closures.luau"}},{"name":"isclosureprotected","desc":"Returns if the given function is protected against hooks.\\n\\n\\n:::tip Whitelists\\nYou can use this function if your executor abides by rSUNC to determine if the environment is proper for your whitelist.\\n:::","params":[{"name":"fn","desc":"The function to check.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"If true, the function is protected against hooking.","lua_type":"boolean"}],"function_type":"static","source":{"line":276,"path":"impl/Libraries/closures.luau"}},{"name":"ishooked","desc":"Returns if the given function has been hooked.\\n\\n\\n:::tip Whitelists\\nYou can use this function if your executor abides by rSUNC to determine if the environment is proper for your whitelist.\\n:::","params":[{"name":"fn","desc":"The function to check.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"Whether the function has been hooked.","lua_type":"boolean"}],"function_type":"static","source":{"line":291,"path":"impl/Libraries/closures.luau"}},{"name":"protectfunction","desc":"Makes a function unable to be hooked. This function automatically reverts ANY hooks placed on the function if there are any set.","params":[{"name":"fn","desc":"The function to make unhookable and remove all hooks of.","lua_type":"(T...) -> U..."}],"returns":[],"function_type":"static","source":{"line":302,"path":"impl/Libraries/closures.luau"}},{"name":"comparefunction","desc":"Returns true if the function points to the same code. The function should return false if the function type results in a mis-match (i.e., `fn1` is a Luau closure and `fn2` is a C closure).\\n\\n\\n:::danger newcclosures/ newlclosure comparison\\nFor newcclosures and newlclosures, the result must be derived from the \'deepest\' closure it wraps.\\n\\nFor example, if `fn1` is a newcclosure that wraps a newlclosure that wraps a luau function, and `fn2` is a Luau function, you must search to the deepst call fn1 can do and check if it is `fn2`.\\nThe same should happen if `fn2` is the nested one and `fn1` is a luau function.\\n:::\\n\\nThis function does not check if the function code is the same, only if the two functions point to the same \'Prototype\' or \'C function\'.\\n\\n### Examples\\n\\n```lua\\nprint\\"comparefunction test\\"\\nlocal x = function() end\\nprint(comparefunction(function() end, function() end)) -- false\\nprint(comparefunction(x, x)) -- true\\nprint(comparefunction(x, clonefunction(x))) -- true\\nprint(comparefunction(x, newcclosure(x))) -- true\\nprint(comparefunction(x, newlclosure(x))) -- true\\nprint(comparefunction(newcclosure(x), x)) -- true\\nprint(comparefunction(newlclosure(x), x)) -- true\\nprint(comparefunction(print, newcclosure(print))) -- true\\nprint(comparefunction(print, newlclosure(print))) -- true\\nprint(comparefunction(print, newcclosure(warn))) -- false\\nprint(comparefunction(print, newlclosure(warn))) -- false\\nprint(comparefunction(newcclosure(print), newcclosure(print))) -- true\\nprint(comparefunction(\\n    newcclosure(\\n        newlclosure(\\n            newcclosure(\\n                print\\n            )\\n        )\\n    ),\\n    newlclosure(\\n        newcclosure(\\n            newlclosure(\\n                print\\n            )\\n        )\\n    ))\\n) -- true\\nprint\\"comparefunction test end\\"\\n```","params":[{"name":"fn1","desc":"The first function to compare.","lua_type":"(T...) -> U..."},{"name":"fn2","desc":"The second function to compare.","lua_type":"(T...) -> U..."}],"returns":[{"desc":"Whether the two functions point to the same code.","lua_type":"boolean"}],"function_type":"static","source":{"line":357,"path":"impl/Libraries/closures.luau"}}],"properties":[],"types":[],"name":"closures","desc":"Contains functions which interact and modify closures and their behaviour.","tags":["Library"],"source":{"line":8,"path":"impl/Libraries/closures.luau"}}')}}]);