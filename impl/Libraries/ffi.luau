--!strict

--[=[
    @class ffi
    @tag Library
]=]
local ffi = {}

--[=[
    Adds multiple C declarations for types or external symbols (named variables or functions).
    The contents of the string (the part in green above) must be a sequence of C declarations, separated by semicolons. The trailing semicolon for a single declaration may be omitted.
    Please note, that external symbols are only declared, but they are not bound to any specific address, yet. Binding is achieved with C library namespaces (see below).
    C declarations are not passed through a C pre-processor, yet. No pre-processor tokens are allowed, except for #pragma pack. Replace #define in existing C header files with enum, static const or typedef and/or pass the files through an external C pre-processor (once). Be careful not to include unneeded or redundant declarations from unrelated header files. 
        
    @within ffi
    @tag Optional
]=]
function ffi.cdef(def: string): ()
    
end

--[=[
    This loads the dynamic library given by name and returns a new C library namespace which binds to its symbols. On POSIX systems, if global is true, the library symbols are loaded into the global namespace, too.
    If name is a path, the library is loaded from this path. Otherwise name is canonicalized in a system-dependent way and searched in the default search path for dynamic libraries:
    On POSIX systems, if the name contains no dot, the extension .so is appended. Also, the lib prefix is prepended if necessary. So ffi.load("z") looks for "libz.so" in the default shared library search path.
    On Windows systems, if the name contains no dot, the extension .dll is appended. So ffi.load("ws2_32") looks for "ws2_32.dll" in the default DLL search path. 

    @within ffi
    @tag Optional
]=]
function ffi.load(name: string): ()
    
end

--[=[
    Creates a cdata object for the given ct. VLA/VLS types require the nelem argument. The second syntax uses a ctype as a constructor and is otherwise fully equivalent.
    The cdata object is initialized according to the rules for initializers, using the optional init arguments. Excess initializers cause an error.
    Performance notice: if you want to create many objects of one kind, parse the cdecl only once and get its ctype with ffi.typeof(). Then use the ctype as a constructor repeatedly.
    Please note, that an anonymous struct declaration implicitly creates a new and distinguished ctype every time you use it for ffi.new(). This is probably not what you want, especially if you create more than one cdata object. Different anonymous structs are not considered assignment-compatible by the C standard, even though they may have the same fields! Also, they are considered different types by the JIT-compiler, which may cause an excessive number of traces. It's strongly suggested to either declare a named struct or typedef with ffi.cdef() or to create a single ctype object for an anonymous struct with ffi.typeof(). 

    @within ffi
    @tag Optional
]=]
function ffi.new(ct: string): ()
    
end

--[=[
    Creates a ctype object for the given ct.
    This function is especially useful to parse a cdecl only once and then use the resulting ctype object as a constructor. 
                
    @within ffi
    @tag Optional
]=]
function ffi.typeof(ct: string): ()
    
end

--[=[
    Creates a scalar cdata object for the given ct. The cdata object is initialized with init using the "cast" variant of the C type conversion rules.
    This functions is mainly useful to override the pointer compatibility checks or to convert pointers to addresses or vice versa. 
                
    @within ffi
    @tag Optional
]=]
function ffi.cast(ct: string, init: any): ()
    
end

--[=[
    Creates a ctype object for the given ct and associates it with a metatable. Only struct/union types, complex numbers and vectors are allowed. Other types may be wrapped in a struct, if needed.
    The association with a metatable is permanent and cannot be changed afterwards. Neither the contents of the metatable nor the contents of an __index table (if any) may be modified afterwards. The associated metatable automatically applies to all uses of this type, no matter how the objects are created or where they originate from. Note that predefined operations on types have precedence (e.g. declared field names cannot be overridden).
    All standard Lua metamethods are implemented. These are called directly, without shortcuts, and on any mix of types. For binary operations, the left operand is checked first for a valid ctype metamethod. The __gc metamethod only applies to struct/union types and performs an implicit ffi.gc() call during creation of an instance. 
                
    @within ffi
    @tag Optional
]=]
function ffi.metatype(ct: string, metatable: table): ()
    
end

--[=[
    Associates a finalizer with a pointer or aggregate cdata object. The cdata object is returned unchanged. 
    
    @within ffi
    @tag Optional
]=]
function ffi.gc(cdata: any, finalizer: any): ()
    
end

--[=[
    Returns the size of ct in bytes. Returns nil if the size is not known (e.g. for "void" or function types). Requires nelem for VLA/VLS types, except for cdata objects. 
    
    @within ffi
    @tag Optional
]=]
function ffi.sizeof(ct: string): number?
    
end

--[=[
    Returns the minimum required alignment for ct in bytes. 
    
    @within ffi
    @tag Optional
]=]
function ffi.alignof(ct: string): number?
    
end

return ffi
