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
function scheduler.connectprestep<T..., U...>(jobName: SchedulerJobName, callback: (T...) -> U...): SchedulerJobStepConnection
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
function scheduler.connectpoststep<T..., U...>(jobName: SchedulerJobName, callback: (T...) -> U...): SchedulerJobStepConnection
    return nil :: any
end

return scheduler
