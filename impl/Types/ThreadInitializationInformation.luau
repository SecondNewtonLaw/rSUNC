--[=[
    Contains information to initialize the execution of a new luau thread.
    @class ThreadInitializationInformation
    @tag Type
]=]
local ThreadInitializationInformation = {}

--[=[
    The parent thread. If nil, the caller is assumed to be the parent.

    @prop thread thread?
    @within ThreadInitializationInformation
]=]
ThreadInitializationInformation.thread = nil

--[=[
    The script global for the thread. This will __not__ modify the thread's RobloxExtraSpace/userdata field. 

    @prop script LocalScript | Script | ModuleScript
    @within ThreadInitializationInformation
]=]
ThreadInitializationInformation.script = nil

--[=[
    The identity of the thread (execution context), if nil, the parents execution context is used.

    :::warning
    This value must be between 0 and 8, else the parent execution context is used.
    :::

    @prop identity number
    @within ThreadInitializationInformation
]=]
ThreadInitializationInformation.identity = 0

--[=[
    The environment of the thread, if nil, a sandboxed version of the parent's environment is used.

    @prop env { [any]: any } | nil
    @within ThreadInitializationInformation
]=]
ThreadInitializationInformation.env = {}
