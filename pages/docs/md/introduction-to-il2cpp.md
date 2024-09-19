# Introduction to IL2CPP
>[!NOTE]
> Please gain some basic familiarity with C#/.NET if you haven't already. This documentation assumes you have a basic understanding of terms used in the space.

Before Gang Beasts v1.21.1, we used to be able to do a lot more with modding, such as full Harmony support, out-of-the-box importing of more Unity packages, accurate source decompilation of code using DnSpy, etc... This is because the game used to use Unity's Mono backend for code compilation. This backend would compile C# code to lower level instruction code known as CIL, or simply IL, which stands for Common Intermediate Language or just Intermediate Language. These instructions were changeable at runtime, which made modding a breeze using patching tools like MonoMod and Harmony, and decompilation even easier.  
Unfortunately, once Gang Beasts began receiving updates again, Boneloaf (the developers of Gang Beasts) switched the game over to Unity's IL2CPP backend for performance and compatibility reasons. This adds an extra step to compilation, converting the IL to even lower level C++ code (which then compiles to machine code), making the code potentially faster but also much harder to decompile and modify.  
Thanks to MelonLoader and its dependencies, its still possible to modify the game almost the same way we did before, just with a few janky bits.

> [!TIP] 
> Further reading about modding with C# in a Unity IL2CPP domain is covered on the [MelonLoader wiki](https://melonwiki.xyz) and the [Il2CppInterop docs](https://github.com/BepInEx/Il2CppInterop/tree/master/Documentation).

## Notable IL2CPP Differences

### Harmony
When you work with Harmony in IL2CPP, you're not manipulating the code of the game like in Mono. Instead, you're basically hooking into generated assemblies that call the original native method.  
What this means is Harmony transpilers are no longer possible entirely. You can only patch a method using a prefix or a postfix. The recommended way of creating a Harmony patch is as follows:
```csharp
using System;
using HarmonyLib;
using MelonLoader;

namespace MyFirstMod;

public static class VanillaTypePatches // It is recommended to follow these naming conventions (PascalCase + Vanilla type name + "Patches" at the end)
{
    [HarmonyPatch(typeof(VanillaType), nameof(VanillaType.VanillaMethod))] // Replace VanillaType and VanillaMethod with the type and method you want to patch
    private static class VanillaMethodPatch // This is a class because you can put both a prefix and a postfix on the same method
    {
        /* Called just before VanillaMethod. Returns a bool to decide whether to run the original method or not: false = skip original method, true = don't skip. Can also be void if you want it to always run the original method.
        Try to prefer using Postfix as this can prevent other patches from running. MUST BE CALLED "Prefix" OR HAVE THE [HarmonyPrefix] ANNOTATION! */
        private static bool Prefix()
        {
            // Can be anything
            return true;
        }

        private static void Postfix() // Called after VanillaMethod. Recommended for most patching cases to ensure mod compatibility. MUST BE CALLED "Postfix" OR HAVE THE [HarmonyPostfix] ANNOTATION!
        {
            // Can be anything
        
            Melon<Core>.Logger.Msg(ConsoleColor.Green, "Patch worked!") // This will be called after VanillaMethod is finished but before it returns a value, allowing you to modify said value if it exists (explained later)
        }
    }
}
```
> TODO: Move harmony patch example to separate page and provide info about [injections](https://harmony.pardeike.net/articles/patching-injections.html)

> [!WARNING]
> IL2CPP Harmony patches do not work for constructors OR generics. Do not be fooled by ```MethodType.Constructor```!

> [!TIP]
> Further reading about Harmony can be found in [their docs](https://harmony.pardeike.net/articles/intro.html) or our [brief overview]() (link pending). Note that MelonLoader uses a fork of Harmony called [HarmonyX](https://github.com/BepInEx/HarmonyX/wiki) that has a small difference in workflow, however the original Harmony docs should still be relevant.

