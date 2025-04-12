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
    @param prop string -- The that is the callback.
    @return (T...) -> U... -- The callback that the instance contains at the given property.
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
    Gets the environment of a running script.

    @param instance LuaSourceContainer -- The script to obtain the environment of.
    @return T | nil -- The environment of the script, nil if the script is not running.
    @error Cannot get the environment of a scipt that runs on the server -- The provided script is with a `RunContext` that is not `RunContext.Client` 

    :::danger Implementation 
    This function may not perform a GC scan in an effort to find the Script object.
    :::
]=]
function instances.getsenv<T>(instance: LuaSourceContainer): T?
    return nil :: any
end

--[=[
    Gets a non-runnable closure which holds debug info (constants, upreferences, debugname, etc) of the script's main thread.
    @param instance LuaSourceContainer -- The script to get the closure of.
    @return (T...) -> U... -- The 'main' closure of the script.
    @error No bytecode found -- The script holds no bytecode.
    @error Cannot get closure of a server script -- The script provided is a server script, and its source isn't available.

    :::danger Implementation 
    This function may not perform a GC scan in an effort to find the Script object.
    :::
]=]
function instances.getscriptclosure<T..., U...>(instance: LuaSourceContainer): (T...) -> U...
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

return instances
