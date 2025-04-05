# Luau Compiler Compliance

When compiling bytecode using `Luau::compile`, the bytecode emitted will contain the `GETIMPORTS` bytecode instruction.
This is generally fine on tables that are immutable (meaning they do not change), however globals such as `workspace`, `game` and a few others such as `script` cannot suffer from this behaviour.

#### Why is this an issue?
If we inspect `luau_load`, we will see that when it is deserializing and loading the bytecode into memory, they do something tricky on the constants, they have a specific clase called `LBC_CONSTANT_IMPORT`. This is a Luau optimization that attempts to obtain everything a function may need that is known to not change, in order to improve performance. This is great! However, this indirectly inlines properties from globals such as `game`, `workspace` and others. This behaviour is **bad**.

ROBLOX themselves know this is an issue, and have made internally a small list for the compiler to not optimize these on the `CompilerOptions::mutableGlobals` field of the compiler options, which is the following:
```cpp
const char *mutableGlobals[] = {
        "Game", "Workspace", "game", "plugin", "script", "shared", "workspace",
        nullptr
};
```

However, rSUNC has its own set of mutable globals which must also be defined on this array to prevent issues, which are the following `_ENV`, `_GENV` and `_RENV`.

This also includes Luau optimizations for Vector types, Luau optimizes them properly on Roblox-compiled code as they have already resolved this issue, however we do not have this resolved! In order to allow the Vector3 optimizations to shine we must set the `CompilerOptions::vectorLib`, `CompilerOptions::vectorCtor` and `CompilerOptions::vectorType` to the appropriate values, being `Vector3`, `new` and `Vector3`.

We also need to note that you must make use of `CompilerOptions::optimizationLevel` to be of 1 and the `CompilerOptions::debugLevel` to be of 1.

In summary, we must make our compiler play nice with ROBLOX, as well as with our types. This concludes on a simple CompileLuau function.

```cpp
std::string CompileLuau(std::string_view szLuauCode) {
    const char *mutableGlobals[] = {
            "Game", "Workspace", "game", "plugin", "script", "shared", "workspace",
            "_ENV", "_GENV", "_RENV", // rSUNC globals.
            nullptr
    };

    auto compileOpts = Luau::CompileOptions { };
    compileOpts.optimizationLevel = 1;
    compileOpts.debugLevel = 1;
    compileOpts.vectorLib = "Vector3";
    compileOpts.vectorCtor = "new";
    compileOpts.vectorType = "Vector3";
    compileOpts.mutableGlobals = mutableGlobals;
    return Luau::compile(szLuauCode.data(), compileOpts, {}, BYTECODE_ENCODER /* Studio requires no bytecode encoder! */);
}
```

This function contains all elements required to have your compiler be rSUNC compliant.