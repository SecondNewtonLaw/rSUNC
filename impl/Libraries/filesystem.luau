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
    @param asBuffer boolean? -- If true, return content as a buffer; if false (default), return as a string.
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
    Moves or renames a file. Does **not** work on folders.

    @within filesystem
    @param oldpath string -- The current path of the file.
    @param newpath string -- The desired new path for the file.
    @error Cannot move file from '%s' to '%s' -- Failed due to permissions, item not found, `oldpath` is a folder, target path invalid, or other OS issues.

    :::warning Behavior
    If `newpath` already exists, it will overwrite it. Use `movefolder` for directories.
    :::
]=]
function filesystem.movefile(oldpath: string, newpath: string): () end

--[=[
    Moves or renames a folder. Does **not** work on files.

    @within filesystem
    @param oldpath string -- The current path of the folder.
    @param newpath string -- The desired new path for the folder.
    @error Cannot move folder from '%s' to '%s' -- Failed due to permissions, item not found, `oldpath` is a file, target path invalid, or other OS issues.

    :::warning Behavior
    If `newpath` already exists, it will overwrite it. Use `movefile` for files.
    :::
]=]
function filesystem.movefolder(oldpath: string, newpath: string): () end

--[=[
    Moves or renames a folder asynchronously. Does **not** work on files.

    This function yields the current thread until the folder move/rename operation is complete or an error occurs.

    @within filesystem
    @yields
    @param oldpath string -- The current path of the folder.
    @param newpath string -- The desired new path for the folder.
    @error Filesystem library not initialized. -- The filesystem library was not properly initialized.
    @error Source path '%s' is outside the allowed workspace. -- The source path is not within the permitted workspace.
    @error Destination path '%s' is outside the allowed workspace. -- The destination path is not within the permitted workspace.
    @error Cannot move folder '%s': Source does not exist or is not a directory. -- The source path is not a valid existing folder.
    @error Cannot move folder from '%s' to '%s': %s -- Failed due to permissions, item not found, `oldpath` is a file, target path invalid, or other OS issues.

    :::warning Behavior
    If `newpath` already exists, it will overwrite it. Use `movefile` for files.
    :::
]=]
function filesystem.movefolderasync(oldpath: string, newpath: string): ()
    return nil :: any
end

--[=[
    Copies a file.

    @within filesystem
    @param sourcepath string -- The path of the file to copy.
    @param destinationpath string -- The path where the copy should be created.
    @error Cannot copy file from '%s' to '%s' -- Failed due to permissions, source not found, destination path invalid, or other OS issues.

    :::warning Behavior
    If `destinationpath` already exists, it will likely be overwritten. This function typically only works for files. For copying folders, use `copyfolder`.
    :::
]=]
function filesystem.copyfile(sourcepath: string, destinationpath: string): () end

--[=[
    Recursively copies a folder and its contents.

    @within filesystem
    @param sourcepath string -- The path of the folder to copy.
    @param destinationpath string -- The path where the copied folder should be created.
    @error Cannot copy folder from '%s' to '%s' -- Failed due to permissions, source not found, `sourcepath` is a file, destination path invalid, or other OS issues during recursion.

    :::warning Behavior
    If `destinationpath` already exists as a folder, the contents of `sourcepath` might be merged into it, or it might error, depending on implementation. If `destinationpath` exists as a file, it will error. This function recursively copies all subfolders and files. Use `copyfile` for single files.
    :::
]=]
function filesystem.copyfolder(sourcepath: string, destinationpath: string): () end

--[=[
    Lists all files and folders within a specified directory path according to the provided options.

    @within filesystem
    @param path string -- The path to the directory.
    @param options ListfilesOptions? -- A table containing options like `Recursive` (boolean, default false) and `Hidden` (boolean, default true).
    @return {string} -- A list of names (or relative paths if recursive) of files and folders within the directory.
    @error Cannot list directory '%s' -- The directory does not exist or cannot be accessed.
]=]
function filesystem.listfiles(path: string, options: ListfilesOptions?): {string}
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
    Deletes a specified folder (directory) and all of its contents recursively, asynchronously.

    This function yields the current thread until the folder deletion operation is complete or an error occurs.

    @within filesystem
    @yields
    @param path string -- The path to the folder to delete.
    @error Filesystem library not initialized. -- The filesystem library was not properly initialized.
    @error Path '%s' is outside the allowed workspace. -- The path is not within the permitted workspace.
    @error Cannot delete folder '%s': %s -- The folder does not exist, cannot be deleted due to permissions, or the path isn't a folder or other issues (e.g., a file within is locked).

    :::warning Behavior
    This function permanently deletes the specified folder and **all** files and subfolders within it. Use with caution.
    :::
]=]
function filesystem.delfolderasync(path: string): ()
    return nil :: any
end

--[=[
    Retrieves properties of a specified file or folder.

    @within filesystem
    @param path string -- The path to the file or folder.
    @return ItemProperties? -- A table containing properties (size, creation time, last modified time, hidden, read-only), or nil if the path does not exist. Size will always be `0` for folders.
    @error Cannot get properties for '%s' -- Permissions error or other OS issue preventing access.
]=]
function filesystem.getproperties(path: string): ItemProperties?
    return nil :: any
end

--[=[
    Sets modifiable properties of a specified file or folder.

    @within filesystem
    @param path string -- The path to the file or folder.
    @param properties ItemProperties -- A table containing the properties to set. Only `IsHidden` and `IsReadOnly` are typically settable for both files and folders. Other properties in the table are ignored.
    @error Cannot set properties for '%s' -- The path does not exist, permissions error, or property modification failed.

    :::info Settable Properties
    Generally, only the `IsHidden` and `IsReadOnly` flags can be reliably modified. Timestamps and size are usually managed by the OS. The function should ideally ignore attempts to set read-only properties specified in the input table. The effect of `IsReadOnly` on folders may vary by OS.
    :::
]=]
function filesystem.setproperties(path: string, properties: ItemProperties): () end

--[=[
    Takes a path to a local file (e.g., an image) and returns a Roblox content URL (e.g., `rbxasset://<filehash>`) that can be used to load the asset within Roblox interfaces.

    @within filesystem
    @param path string -- The path to the local asset file.
    @return string -- A Roblox asset URL (e.g., `rbxasset://some_generated_identifier`).
    @error Cannot process asset '%s' -- The file does not exist or could not be processed.

    :::info Usage
    This function allows importing local files (like images, sounds, etc.) for use in Roblox UIs or parts by converting them into a temporary or cached asset URL recognized by the engine. The underlying mechanism might involve hashing the file content or uploading it to a temporary storage accessible by the client.
    :::
]=]
function filesystem.getcustomasset(path: string): string
    return nil :: any
end

--[=[
    Reads the content of a specified file asynchronously, returning it as a string or a buffer.

    This function yields the current thread until the file reading operation is complete or an error occurs.

    @within filesystem
    @yields
    @param path string -- The path to the file.
    @param asBuffer boolean? -- If true, return content as a buffer; if false (default), return as a string.
    @return string | buffer | nil -- The content of the file as a string or buffer on success, or `nil` on failure.
    @return string? -- An error message if reading failed.
    @error Filesystem library not initialized. -- The filesystem library was not properly initialized.
    @error Path '%s' is outside the allowed workspace. -- The path is not within the permitted workspace.
    @error Cannot read file 'file does not exist' -- The file at the specified path does not exist.
    @error Cannot read file '%s' -- A general error occurred during file reading (e.g., permissions).
    @error Cannot read file 'file content too big' -- The file content exceeds the maximum allowed size.
]=]
function filesystem.readfileasync(path: string, asBuffer: boolean?): (string | buffer | nil, string?)
    return nil :: any, nil :: any
end

return filesystem
