# PowerPC Altivec/VMX Extension Module

The PowerPC processor module in IDA Pro does not handle Altivec/VMX instructions. Many
well-known PowerPC implementations include support for Altivec (such as the Apple G4/G5 range,
or the majority of next generation game consoles). Fortunately IDA Pro supports the concept of
extension modules that can add support for non-standard instructions, so this extension adds
support for the Altivec instruction set.

INSTALLATION
------------
Place the two processor extension module ppcaltivec64.dll (currently only 64-bit IDA is supported)
within your IDA Pro 'plugins' directory. By default the plugin is active when dealing with PPC code, but
you can disable/re-enable the plugin by using the entry in the Edit/Plugins menu. If you want
the plugin to be disabled on load, you will have to edit this source code. Change the value of
g_HookState to 'kDisabled' and rebuild.

NOTES
-----
The versions of ppc.w32 and ppc64.w64 that were in initial distributions of IDA Pro 4.8 contain
a flaw that will trigger an illegal read of memory when used with this extension. If you happen
to encounter crashes in these modules, I would recommend that you contact Data Rescue,
specifically Ilfak Guilfanov - ig@datarescue.com - to obtaining corrected versions of these
modules, as I did.