--[=[
    Provides functions to interact with the local filesystem.

    @class filesystem
    @tag Library
]=]
local filesystem = {}

--[=[
    Writes content (string or buffer) to a specified file. Creates the file if it does not exist, and overwrites it if it does.

    @within filesystem
    @param path string -- The path to the file.
    @param content string | buffer -- The content to write to the file.
    @error Cannot write to file '%s' -- The file could not be written to due to permissions or other OS-level issues.

    :::info Paths
    Paths should ideally be relative to a designated workspace or root directory defined by the executor environment. Absolute paths are restricted.
    :::
]=]
function filesystem.writefile(path: string, content: string | buffer): () end

--[=[
    Reads the content of a specified file, returning it as a string or a buffer.

    @within filesystem
    @param path string -- The path to the file.
    @param asBuffer boolean -- If true, return content as a buffer; if false (default), return as a string.
    @return string | buffer -- The content of the file, either as a string or a buffer based on the asBuffer flag.
    @error Cannot read file '%s' -- The file does not exist or cannot be read due to permissions.
]=]
function filesystem.readfile(path: string, asBuffer: boolean?): string | buffer
    return nil :: any
end

--[=[
    Loads a Lua chunk from the specified file but does not run it.

    @within filesystem
    @param path string -- The path to the Lua file.
    @return ((...any) -> ...any) | nil -- The loaded chunk as a function, or nil if loading failed.
    @return string? -- An error message if loading failed.
    @error Cannot read file '%s' -- The file does not exist or cannot be read due to permissions.

    :::info Environment
    The loaded chunk inherits the environment of the caller.
    :::

    :::tip `loadstring`
    This function behaves similarly to `loadstring` but operates on file paths instead of raw strings. Refer to `closures.loadstring` for potential compilation settings.
    :::
]=]
function filesystem.loadfile(path: string): ((...any) -> ...any | nil, string?)
    return nil :: any, nil :: any
end

--[=[
    Loads and runs a Lua chunk from the specified file.

    @within filesystem
    @param path string -- The path to the Lua file.
    @return ...any -- The values returned by the executed chunk.
    @error Cannot read file '%s' -- The file does not exist or cannot be read due to permissions.
    @error ... -- Any runtime error originating from the executed chunk.

    :::info Environment
    The executed chunk inherits the environment of the caller.
    :::
]=]
function filesystem.dofile(path: string): ...any
    return nil :: any
end

--[=[
    Deletes a specified file.

    @within filesystem
    @param path string -- The path to the file to delete.
    @error Cannot delete file '%s' -- The file does not exist, cannot be deleted due to permissions, or the path isn't a file or other issues.
]=]
function filesystem.delfile(path: string): () end

--[=[
    Appends content (string or buffer) to the end of a specified file. Creates the file if it does not exist.

    @within filesystem
    @param path string -- The path to the file.
    @param content string | buffer -- The content to append to the file.
    @error Cannot append to file '%s' -- The file could not be appended to due to permissions or other OS-level issues.
]=]
function filesystem.appendfile(path: string, content: string | buffer): () end

--[=[
    Lists all files and folders within a specified directory path. Can optionally list recursively.

    @within filesystem
    @param path string -- The path to the directory.
    @param recursive boolean? -- If true, recursively list contents of all subdirectories. Defaults to false.
    @return {string} -- A list of names (or relative paths if recursive) of files and folders within the directory.
    @error Cannot list directory '%s' -- The directory does not exist or cannot be accessed.
]=]
function filesystem.listfiles(path: string, recursive: boolean?): {string}
    return {} :: any
end

--[=[
    Checks if a given path points to an existing file.

    @within filesystem
    @param path string -- The path to check.
    @return boolean -- True if the path points to an existing file, false otherwise.
]=]
function filesystem.isfile(path: string): boolean
    return nil :: any
end

--[=[
    Checks if a given path points to an existing folder (directory).

    @within filesystem
    @param path string -- The path to check.
    @return boolean -- True if the path points to an existing folder, false otherwise.
]=]
function filesystem.isfolder(path: string): boolean
    return nil :: any
end

--[=[
    Creates a new folder (directory) at the specified path.

    @within filesystem
    @param path string -- The path where the folder should be created.
    @error Cannot create folder '%s' -- The folder could not be created (e.g., path already exists as a file, permissions issue, invalid path).
]=]
function filesystem.makefolder(path: string): () end

--[=[
    Deletes a specified folder (directory) and all of its contents recursively.

    @within filesystem
    @param path string -- The path to the folder to delete.
    @error Cannot delete folder '%s' -- The folder does not exist, cannot be deleted due to permissions, or the path isn't a folder or other issues (e.g., a file within is locked).

    :::warning Behavior
    This function permanently deletes the specified folder and **all** files and subfolders within it. Use with caution.
    :::
]=]
function filesystem.delfolder(path: string): () end

--[=[
    Takes a path to a local file (e.g., an image) and returns a Roblox content URL (e.g., `rbxasset://<hash>`) that can be used to load the asset within Roblox interfaces.

    @within filesystem
    @param path string -- The path to the local asset file.
    @return string -- A Roblox asset URL (e.g., `rbxasset://some_generated_identifier`).
    @error Cannot process asset '%s' -- The file does not exist, is not a supported asset type, or could not be processed/uploaded.

    :::info Usage
    This function allows importing local files (like images, sounds, etc.) for use in Roblox UIs or parts by converting them into a temporary or cached asset URL recognized by the engine. The underlying mechanism might involve hashing the file content or uploading it to a temporary storage accessible by the client.
    :::
]=]
function filesystem.getcustomasset(path: string): string
    return nil :: any
end

return filesystem
