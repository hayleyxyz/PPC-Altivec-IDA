

# PowerPC Altivec/VMX Extension Module

The PowerPC processor module in IDA Pro does not handle Altivec/VMX instructions. Many
well-known PowerPC implementations include support for Altivec (such as the Apple G4/G5 range,
or the majority of next generation game consoles). Fortunately IDA Pro supports the concept of
extension modules that can add support for non-standard instructions, so this extension adds
support for the Altivec instruction set.

INSTALLATION
------------
Place the appropriate processor extension module ppcaltivec64.(dll/so/dylib) (currently only 64-bit IDA has been compiled for)
within your IDA Pro 'plugins' directory. By default the plugin is active when dealing with PPC code, but
you can disable/re-enable the plugin by using the entry in the Edit/Plugins menu. If you want
the plugin to be disabled on load, you will have to edit this source code. Change the value of
g_HookState to 'kDisabled' and rebuild.

COMPILING
------------

## Windows
On Windows, you should be able to open the solution and compile, provided you have the idasdk70 folder inside C:\Program Files\IDA 7.0.

## macOS / Linux
Place the project folder inside idasdk70/plugins. cd to idasdk70 then run make:

Run
`$ make -C plugins/ppcaltivec __EA64__=1 __MAC__=1 NDEBUG=1`

Change \_\_MAC\_\_ to \_\_LINUX\_\_ if applicable.

The output binary will be in idasdk70/bin/plugins

## cmake
You may also use CMake

`$ mkdir PPC-Altivec-IDA/cmake-build`  
`$ cd PPC-Altivec-IDA/cmake-build`  
`$ cmake -D IDASDK:string="/Applications/IDA Pro 7.0/idasdk70" ..`  
`$ make`  

Replace IDASDK variable with path to the IDA SDK on your system.


CHANGELOG
------------
#### 27.03.05 - Dean - V1.0
* Created

#### 14.05.05 - Dean - V1.1
* Correction to operand register number extraction.
* Correction to operand order for vmaddfp.
* Now handles initial analysis without any additional hassle.
* Added support for Altivec opcodes with 4 parameters.

#### 22.05.05 - Dean - V1.2
* Added support for auto comments.

#### 26.09.05 - Dean - V1.3
* Support for IDA Pro 4.9

#### 07.12.10 - xorloser - V1.8
* Support for Gekko instructions merged from the Gekko extension module created by HyperIris.
* Also incldued support for SPRG names for PS3 as added by Tridentsx.

#### 12.03.18  yui-konnu   V1.9
* Support for IDA 7. Added SPRG descriptions to auto-comments.

#### 03.04.18  yui-konnu   V1.9.1
* Added Linux/macOS build methods.

#### 08.06.18  yui-konnu   V1.9.1
* Added CMake build file.
