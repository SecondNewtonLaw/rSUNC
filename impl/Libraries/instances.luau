--[=[
    Provides functions to manipulate instances.
    @class instances
    @tag Library
]=]
local instances = {}

--[=[
    Clones a reference of the given instance.

    @within instances
    @param object Instance -- The instance to clone.
    @return Instance -- A brand new reference to the given instance.

    :::tip Usage
    By cloning references to instances, you can bypass weak table-style attacks, which is a way of detecting references to objects which should not have references.
    :::
]=]
function instances.cloneref<T>(object: T & Instance): T & Instance
    return nil :: any
end

--[=[
    Compares the underlying instances of two object references.
    
    @within instances
    @param object1 Instance -- The first instance.
    @param object2 Instance -- The second instance.
    @return boolean -- If true, both references point to the same instance, else false.
    
    :::tip Usage
    `instances.cloneref` allows you to clone a reference to an object, this breaks the normal way Roblox performs equality checks.
    
    This function allows you to compare the actual thing the two references point to, allowing you to know if they reference the same instance!
    :::
]=]
function instances.compareinstances<T>(object1: T & Instance, object2: T & Instance): boolean
    return nil :: any
end

--[=[
    Invalidates the reference of the given instance.

    @within instances
    @param object Instance -- The instance to invalidate.
    @error The reference cannot be invalidated (not in cache) -- The reference you provided cannot be invalidated, this is due to it not being on the instance cache.

    :::tip Usage
    Invalidating the reference to an instance allows you to make subsequent calls to certain functions return a different pointer instead of the one you have. This also makes the reference you hold unique to you up to that point.
    :::
]=]
function instances.invalidatereference<T>(object: T & Instance): () end

--[=[
    Checks if the reference to the given instance is still valid.

    @within instances
    @param object Instance -- The instance to check.
    @return boolean -- If true, the reference to the instance is still valid.

    :::tip Usage
    This function is used to check if an instance is still valid after the reference is invalidated using `instances.invalidatereference`.
    :::
]=]
function instances.isreferencevalid<T>(object: T & Instance): boolean
    return nil :: any
end

--[=[
    Makes all references that are `object1` point to what `object2` is referencing instead.
    
    @within instances
    @param object1 Instance -- The instance to replace.
    @param object2 Instance -- The instance to replace it with.
    @error The reference cannot be modified (not in cache) -- The reference you provided cannot be modified, this is due to it not being on the instance cache.

    :::tip Usage
    You can use this function to replace references to an instance all throughout the game. i.e.: replacing a Value instance and affecting all already obtained references to it.
    :::

    :::note Remarks
    Some instances, such as the DataModel (aka `game`), are not affected by this function.
    :::
]=]
function instances.replacereference<T>(object1: T & Instance, object2: T & Instance): () end

--[=[
    Gets the version of the ROBLOX place you are in.

    @within instances
    @return number -- The version of the place.

    :::tip Usage
    This function can be used to guarantee features work only on a version deemed 'safe' of the game. Useful for premium scripts.
    :::
]=]
function instances.getplaceversion(): number
    return nil :: any
end

--[=[
    Gets the callback value of the given instance and property.
    
    @within instances
    @param instance Instance -- The instance to get the callback value from.
    @param prop string -- The name of the callback property.
    @return (T...) -> U... | nil -- The callback that the instance contains at the given property.
    @error property with name '%s' does not exist. -- The given property (named %s) does not exist on the given instance.
]=]
function instances.getcallbackvalue<T..., U...>(instance: Instance, prop: string): ((T...) -> U...) | nil
    return nil :: any
end

--[=[
    Gets the property of the given instance.
    
    @within instances
    @param instance T & Instance -- The instance to get the property from.
    @param prop string -- The property to get.
    @return U -- The value of the property.
    @return boolean -- True if the property was hidden, false if it was not.
    @error property with name '%s' does not exist. -- The given property (named %s) does not exist on the given instance.

    :::warning Remarks
    You must support pushing unserializable properties such as '`SharedString`' and '`SystemAddress`'.
    :::

    :::tip Implementation
    You are supposed to obtain the property using the `RBX::Instance::getProperty`/ `RBX::Instance::setProperty` methods. You must not set the property public or scriptable. 
    :::
]=]
function instances.gethiddenproperty<T, U>(instance: T & Instance, prop: string): (U, boolean)
    return nil :: any, nil :: any
end

--[=[
    Retrieves the names of the arguments that a signal's `OnConnect` callback receives.

    @within instances
    @param signal RBXScriptSignal -- The signal instance (e.g., `game.Players.PlayerAdded`).
    @return { string } -- An array-like table containing the names of the arguments.
    @error Expected RBXScriptSignal -- The provided argument was not an `RBXScriptSignal`.
]=]
function instances.getsignalargumentnames(signal: RBXScriptSignal): { string }
    return {} :: any
end

--[=[
    Retrieves the types (or class names for Instances) of the arguments that a signal's `OnConnect` callback receives.

    @within instances
    @param signal RBXScriptSignal -- The signal instance (e.g., `game.Players.PlayerAdded`).
    @return { string } -- An array-like table containing the type or class names of the arguments.
    @error Expected RBXScriptSignal -- The provided argument was not an `RBXScriptSignal`.
]=]
function instances.getsignalargumenttypes(signal: RBXScriptSignal): { string }
    return {} :: any
end

--[=[
    Retrieves the raw Luau bytecode of a `LuaSourceContainer` (Script, LocalScript, ModuleScript).

    @within instances
    @param script LuaSourceContainer -- The script instance.
    @return string -- The bytecode of the script.
    @error userdata<Instance<LuaSourceContainer>> -- The provided argument was not a `LuaSourceContainer` instance.
    @error bytecode not found -- The script does not contain bytecode (e.g., it's empty or an external script).
    @error unknown error occurred while trying to fetch script closure. -- An internal error occurred, possibly related to incompatible environment (e.g., Team Create for Server Scripts).

    :::warning Team Create
    Fetching bytecode for Server Scripts in Team Create sessions may not be supported.
    :::
]=]
function instances.getscriptbytecode(script: LuaSourceContainer): string
    return nil :: any
end

--[=[
    Returns the `LuaSourceContainer` instance of the script that called this function.

    @within instances
    @return (LuaSourceContainer | string)? -- The calling script instance, or `nil` if called from a context without a script (e.g., command bar), or string if an error occurred.
]=]
function instances.getcallingscript(): (LuaSourceContainer | string)?
    return nil :: any
end

--[=[
    Gets the environment of a running script.

    @param script LuaSourceContainer -- The script to obtain the environment of.
    @return T | nil -- The environment of the script, nil if the script is not running.
    @error script is running in a different Luau VM -- The script you tried to get the environment does not share the same mainthread state (Running under an actor/ in a different Luau VM).
    
    :::tip Implementation
    This function may perform GC scans to find script threads and obtain their environment.
    :::

    :::danger Actors
    If the script is running in a different `mainthread` you must throw the 'script is running in a different Luau VM' error in order to prevent possible vulnerabilities and other issues associated with actors.
    :::
]=]
function instances.getsenv<T>(script: LuaSourceContainer): T?
    return nil :: any
end

--[=[
    Gets a non-runnable closure which holds debug info (constants, upreferences, debugname, etc) of the script's main thread.
    @param instance LuaSourceContainer -- The script to get the closure of.
    @return ((T...) -> (U...)) | nil -- The 'main' closure of the script, `nil` if the script has no bytecode.
    @error Cannot get closure of a server script -- The script provided is a server script, and its source isn't available.

    :::danger Implementation 
    This function may not perform a GC scan in an effort to find the Script object.
    :::
]=]
function instances.getscriptclosure<T..., U...>(instance: LuaSourceContainer): ((T...) -> U...) | nil
    return nil :: any
end

--[=[
    Exchanges the underlying pointer between two instances.

    @within instances
    @param object1 Instance -- The first instance.
    @param object2 Instance -- The second instance.

    :::tip Usage
    This can be used in place of `instances.replacereference` if the user already holds a reference to the object you want replaced. 

    This function, unlike `instances.replacereference` will overwrite the underlying pointer to the instance in the provided reference. This makes it so all instances of this reference are affected, regardless of whether they're just newly obtained from the Instance cache.
    :::

    :::danger Implementation
    The instances MUST be strictly checked to be such.
    :::
]=]
function instances.exchangeinstancepointer<T, U>(object1: T & Instance, object2: U & Instance): () end

--[=[
    Fires a click detector event, which replicates to the server.

    @within instances
    @param detector ClickDetector -- The click detector to fire the event on.
    @param distance number? -- The distance to fire the event at, if nil, defaults to 0.
    @param eventName "MouseClick" | "RightMouseClick" | "MouseHoverEnter" | "MouseHoverLeave" | nil -- The event to fire, if nil, defaults to "MouseClick"
    
    :::danger Implementations
    You should not implement this function in luau.
    :::
]=]
function instances.fireclickdetector(
    detector: ClickDetector,
    distance: number?,
    eventName: "MouseClick" | "RightMouseClick" | "MouseHoverEnter" | "MouseHoverLeave" | nil
): ()
    return nil :: any
end

--[=[
    Describes a TouchType for the firetouchinterest function. 

    **`1`** stands for **`Touch`**, while **`0`** stands for **`TouchEnded`**.

    @type TouchType 1 | 0
    @within instances
    @tag Type
]=]
type TouchType = typeof(1) | typeof(0)

--[=[
    Fires a physics interaction between BasePart objects, which replicates to the server.

    @within instances
    @param part1 BasePart -- The first part.
    @param part2 BasePart -- The second part.
    @param touchType TouchType -- The event to fire.
    @error no world found -- No RBX::World was found for either Part1 or Part2.
    @error overlap in a different world -- Part1 and Part2 live in different RBX::World's and they cannot interact with each other.

    :::danger Implementations
    You should not implement this function in luau.
    :::
]=]
function instances.firetouchinterest(part1: BasePart, part2: BasePart, touchType: TouchType): ()
    return nil :: any
end

--[=[
    Fires a proximity prompt's Triggered event, which replicates to the server.

    @within instances
    @param prompt ProximityPrompt -- The prompt to fire the event on.
    
    :::danger Implementations
    You should not implement this function in luau.
    :::
]=]
function instances.fireproximityprompt(prompt: ProximityPrompt) end

--[=[
    Returns the folder used by the executor to place User Interfaces.

    @within instances
    @return Folder -- The folder which is hidden from the game context.

    :::danger Weak-Table attacks
    This function may be vulnerarble to weak-table style attacks if not properly implemented.

    Make a folder, parent it to CoreGui, and then use `instances.invalidatereference` on it, then return the created folder, this should protect you from this kind of attack!
    :::

    :::danger ContentProvider attacks
    Game developers can use `ContentProvider:PreloadAsync` to detect assets loaded in CoreGui when they should not be loaded, due to this they can check if any UI has been loaded that is not the 
    default ROBLOX Core Gui. You must protect yourself from this kind of attack by caching the return of CoreGui for the function, and returning the cached value after gethui is called. This should maintain the integrity of the system while hiding the new assets that are loaded on CoreGui. *This change may also be needed on the `game` instance*.
    :::
]=]
function instances.gethui(): Folder
    return nil :: any
end

--[=[
    Returns a list with all instances that are currently referenced by the game.
    
    @within instances
    @return { Instance } -- All instances that are currently referenced by the game.

    :::warning Actors
    If an instance is referenced inside an actor, this list of instances should not contain it!
    :::
]=]
function instances.getinstances(): { Instance }
    return nil :: any
end

--[=[
    Returns a list with all instances that are currently referenced by the game and are not parented anything.
    
    @within instances
    @return { Instance } -- All instances that are currently referenced by the game, but with no parent.

    :::warning Actors
    If an instance is referenced inside an actor, this list of instances should not contain it!
    :::
]=]
function instances.getnilinstances(): { Instance }
    return nil :: any
end

--[=[
    Returns a dictionary with all instances that are currently referenced by the game as their value, and a lightuserdata as their key.

    This dictionary is also known as the instance cache.
    
    @within instances
    @return { [userdata]: Instance } -- The internal list ROBLOX uses for holding references to instances in Luau.

    :::warning Actors
    If an instance is referenced inside an actor, this list of instances should not contain it!
    :::
]=]
function instances.getinstancelist(): { [userdata]: Instance }
    return nil :: any
end

--[=[
    Retrieves a list of connection objects associated with a given signal.

    @within instances
    @param signal RBXScriptSignal -- The signal instance (e.g., `game.Players.PlayerAdded`) to get connections from.
    @return { Connection } -- An array-like table containing `Connection` objects for each active connection to the signal.
    @error Expected RBXScriptSignal -- The provided argument was not an `RBXScriptSignal`.
    @error connection cannot be obtained -- An internal error occurred while trying to access the connection list.

    :::tip Usage
    This function allows you to inspect and manage individual connections to a signal. You can check properties like the connected function, its thread, whether it's enabled, or even manually fire, defer, enable, disable, or disconnect specific connections.
    :::

    :::warning Remarks
    - Calling `Disconnect` on a `Connection` object invalidates it. Subsequent attempts to use the object will result in an error.
    - `Fire` and `Defer` methods will not work for connections where `ForeignState` is true (i.e., C functions or connections from different Luau VMs).
    - The order of connections in the returned table might not be predictable.
    :::
]=]
function instances.getconnections(signal: RBXScriptSignal): { Connection }
    return {} :: any -- Placeholder return
end

return instances
