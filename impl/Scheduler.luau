--[=[
    Contains functions to interact with the raw task scheduler.

    @class scheduler
    @tag Library
]=]
local scheduler = {}

--[=[
    @type SchedulerJobName "RenderJob" | "WaitingHybridScriptsJob" | "ModelMeshJob" | "GcJob" | "HeartbeatTask" | "PhysicsJob" | "PathUpdateJob" | "NavigationJob" | "GenericDataModelJob" | "HttpRbxApiJob"
    @within scheduler
]=]
--[=[
    Connects a function to run before a Step of the specified job is ran.

    @within scheduler
    @return SchedulerJobStepConnection
    @error Unknown Job -- This job doesn't exist or is not supported.

    :::warning Callback Note
    The callback you provide **CANNOT** yield or block the thread, or you will block the roblox main thread.
    :::
]=]
function scheduler:ConnectToPreStep<T..., U...>(jobName: SchedulerJobName, callback: (T...) -> U...): SchedulerJobStepConnection
    return nil :: any
end

--[=[
    Connects a function to run after a Step of the specified job is ran.

    @within scheduler
    @return SchedulerJobStepConnection
    @error Unknown Job -- This job doesn't exist or is not supported.

    :::warning Callback Note
    The callback you provide **CANNOT** yield or block the thread, or you will block the roblox main thread.
    :::
]=]
function scheduler:ConnectToPostStep<T..., U...>(jobName: SchedulerJobName, callback: (T...) -> U...): SchedulerJobStepConnection
    return nil :: any
end

--[=[
    Represents a connection to the scheduler.

    @class SchedulerJobStepConnection
    @tag Type
]=]
local SchedulerJobStepConnection
do
    SchedulerJobStepConnection = {}

    --[=[
        If true, this connection is being actively fired, otherwise it was disconnected.

        @prop IsConnected boolean
        @within SchedulerJobStepConnection
        @readonly
    ]=]
    SchedulerJobStepConnection.IsConnected = true

    --[=[
        If true, this connection can be fired, otherwise it was temporarily disabled with `:Disable()`

        @prop IsEnabled boolean
        @within SchedulerJobStepConnection
        @readonly
    ]=]
    SchedulerJobStepConnection.IsEnabled = true

    --[=[
        Enables the connection to be fired, if disabled with `:Disable()`

        @within SchedulerJobStepConnection
    ]=]
    function SchedulerJobStepConnection:Enable(): ()
        return nil
    end

    --[=[
        Prevents this connection from being temporarily fired, can be re-enabled with `:Enable()`

        @within SchedulerJobStepConnection
    ]=]
    function SchedulerJobStepConnection:Disable(): ()
        return nil
    end

    --[=[
        Disconnects this connection which stops it from being fired.
        This will make this connection unusable in the future.

        @within SchedulerJobStepConnection
    ]=]
    function SchedulerJobStepConnection:Disconnect(): ()
        return nil
    end
end
return scheduler