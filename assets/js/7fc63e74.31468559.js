"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[794],{29515:e=>{e.exports=JSON.parse('{"functions":[{"name":"getgc","desc":"Returns a list of objects currently \'alive\' in the garbage collector.\\n\\n\\n:::warning Implementation\\nThis function must automatically suspend the GC to retrieve the list of objects that are correct for when the call originates.\\n:::","params":[{"name":"includeTables","desc":"Whether to include tables in the list. Defaults to `false` if not provided.","lua_type":"boolean?"}],"returns":[{"desc":"A list of objects currently \'alive\' in the garbage collector.","lua_type":"{ vector | buffer | { [any]: any } | string | (...any) -> ...any } | { vector | buffer | string | (...any) -> ...any }"}],"function_type":"static","source":{"line":19,"path":"impl/Libraries/memory.luau"}},{"name":"suspendgc","desc":"Suspends all GC operations temporarily, returning the current state of the Garbage Collector to resume it.\\n\\n:::warning Memory Usage\\nAfter this function is called, memory usage may increase, as after this call the garbage collector is simply no longer collecting memory.\\nYou may forcefully request the GC to run using `memory.gc` or `memory.stepgc`. Granting you full control over the GC.\\n:::\\n\\n:::warning Resumption after Suspension\\nAfter the Garbage Collector is suspended, a call to `memory.resumegc` must follow eventually.\\nIf the thread does not resume the GC and it stops execution (i.e.: thread yields or dies), it will automatically resume itself on the next scheduler cycle in order to prevent a memory leak.\\n:::","params":[],"returns":[{"desc":"The current state of the Garbage Collector, before suspension.","lua_type":"GcState"}],"function_type":"static","errors":[{"lua_type":"Already suspended","desc":"The Garbage collector is already suspended. You must first resume it using memory.resumegc before calling memory.suspendgc again."}],"source":{"line":40,"path":"impl/Libraries/memory.luau"}},{"name":"resumegc","desc":"Resumes the Garbage Collector from the previous state","params":[],"returns":[],"function_type":"static","errors":[{"lua_type":"Garbage Collector Not Suspended","desc":"The garbage collector is not suspended, you cannot resume it!"}],"source":{"line":50,"path":"impl/Libraries/memory.luau"}},{"name":"getgcstate","desc":"Retrieves a copy of the current state of the garbage collector.","params":[],"returns":[{"desc":"The current state of the Garbage Collector","lua_type":"GcState"}],"function_type":"static","source":{"line":60,"path":"impl/Libraries/memory.luau"}},{"name":"gc","desc":"Executes a full garbage collection cycle, regardless if it should be ran or not.\\nThis will temporarily [stop the world](https://stackoverflow.com/questions/40182392/does-java-garbage-collect-always-has-to-stop-the-world) to execute a full GC step.\\n:::warning\\nThis may have a performance cost depending on how big the heap is, and could temporarily pause Roblox!\\n:::","params":[],"returns":[],"function_type":"static","source":{"line":73,"path":"impl/Libraries/memory.luau"}},{"name":"stepgc","desc":"Executes a step on the garbage collection cycle, regardless if it should be ran or not.","params":[],"returns":[],"function_type":"static","source":{"line":80,"path":"impl/Libraries/memory.luau"}},{"name":"isreferenced","desc":"Checks if the given object is currently referenced in the Lua(u) registry.\\n\\n\\n:::info Remarks\\nThis function checks both registry keys and values in search of the given object. This means that if `getreg()[object]` holds a value, this function must return true.\\n:::\\n\\n\\n### Examples\\n```lua\\nlocal part = Instance.new(\\"Part\\")\\n\\ngetreg()[part] = true\\nassert(memory.isreferenced(part) == true, \\"memory.isreferenced must return true once the object is present in the registry, be it in a key, or in a value!\\")\\ngetreg()[part] = nil\\nassert(memory.isreferenced(part) == false, \\"memory.isreferenced must return false once the object is no longer present in the registry!\\")\\n```","params":[{"name":"object","desc":"The object to check.","lua_type":"any"}],"returns":[{"desc":"","lua_type":"boolean"}],"function_type":"static","source":{"line":104,"path":"impl/Libraries/memory.luau"}}],"properties":[],"types":[],"name":"memory","desc":"Provides functions to manipulate the Garbage Collector and memory in general.","tags":["Library"],"source":{"line":6,"path":"impl/Libraries/memory.luau"}}')}}]);