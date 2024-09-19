# Introduction to IL2CPP

> [!TIP] 
> Further reading about reverse engineering or modding with C# in a Unity IL2CPP domain is available on the [MelonLoader wiki](https://melonwiki.xyz).

Before Gang Beasts v1.21.1, we used to be able to do a lot more with modding, such as full Harmony support, out-of-the-box importing of more Unity packages, accurate source decompilation of code using DnSpy, etc... This is because the game used to use Unity's Mono backend for code compilation. This backend would compile C# code to lower level instruction code known as CIL, or simply IL, which stands for Common Intermediate Language or just Intermediate Language. These instructions were changeable at runtime, which made modding a breeze using tools like MonoMod and Harmony.  
Unfortunately, once Gang Beasts began receiving updates again, Boneloaf (the developers of Gang Beasts) switched the game over to Unity's IL2CPP backend for performance and compatibility reasons. This adds an extra step to compilation, converting the IL to even lower level C++ code (which then compiles to machine code), making the code potentially faster but also much harder to decompile and modify.  
Thanks to MelonLoader and its dependencies, its still possible to modify the game almost the same way we did before, just with a few janky bits. 