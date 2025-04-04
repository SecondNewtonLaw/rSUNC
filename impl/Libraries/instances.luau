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
    Some instances, such as the DataModel (aka `game`) are not affected by this function.
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
    return nil ::any
end



return instances
