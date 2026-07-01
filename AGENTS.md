# AGENTS.md

## Cursor Cloud specific instructions

### What this repo is
`xcode_tool` is a collection of macOS/iOS Objective-C developer utilities (see `README.markdown`):
- `NSStringWrappeer/` — the only compilable unit: an `NSString(Wrapper)` category (Java `String`-style methods) plus an Xcode project and unit tests (`NSStringWrapperTests.m`).
- `Shells/` — standalone bash utilities (`removeTailBlank.sh`, `convertImage.sh`, `dailyBuild.sh`).
- `CodeSnippets/`, `Macros/`, `Encoding/` — source/snippets meant to be copied into a consuming Xcode project.
- Root `*.sh` scripts (`setup_snippets.sh`, `setup_reveal.sh`, etc.) are macOS/Xcode installers that touch `~/Library/Developer/Xcode/...`.

There are **no package manifests** (no npm/pip/go/etc.) and **no long-running services** (no server, DB, or web app). "Running the app" means compiling/running the Objective-C code.

### Building & running on Linux (this VM has no Xcode)
The canonical dev environment is macOS + Xcode (`xcodebuild`), which does not exist on this Linux VM. Instead, the GNUstep + GCC Objective-C runtime is installed so the core Objective-C can be compiled and run. The Ubuntu GNUstep packages are built against the **GCC** Objective-C runtime, so compile with `clang -fobjc-runtime=gcc` (not `gnustep-2.0`).

Non-obvious gotchas discovered during setup:
- `objc/objc.h` lives under `/usr/lib/gcc/x86_64-linux-gnu/13/include` (add it with `-I`); it is not on the default clang search path.
- There is no `/usr/lib/libobjc.so` symlink; link against the GCC copy with `-L/usr/lib/gcc/x86_64-linux-gnu/13 -lobjc`.
- `-fconstant-string-class=NSConstantString` is required for `@"..."` literals.
- The bundled GCC ObjC frontend is too old for modern syntax (`@autoreleasepool`, C99 for-loops), so use `clang`, not `gcc`, for the frontend.

To build+run a driver that exercises `NSString(Wrapper)`:
```bash
source /usr/share/GNUstep/Makefiles/GNUstep.sh
INCDIR=NSStringWrappeer/NSStringWrapper
clang -o /tmp/nsw_demo /tmp/nsw_demo/main.m "$INCDIR/NSStringWrapper.m" \
  -I"$INCDIR" -I/usr/lib/gcc/x86_64-linux-gnu/13/include -I/usr/include/GNUstep \
  -fobjc-runtime=gcc -fconstant-string-class=NSConstantString \
  -DGNUSTEP -D_NATIVE_OBJC_EXCEPTIONS -fexceptions -fobjc-exceptions -fPIC -pthread \
  -L/usr/lib -L/usr/lib/gcc/x86_64-linux-gnu/13 -lgnustep-base -lobjc -lm
/tmp/nsw_demo
```
(Provide your own `main.m` that `#import "NSStringWrapper.h"` and calls the category methods.)

### Tests
The real tests (`NSStringWrappeer/NSStringWrapperTests/NSStringWrapperTests.m`) use Apple's SenTestingKit (`STAssert*` macros), which is only available under Xcode — they cannot run via GNUstep on Linux. To validate the library on Linux, replicate the assertions in a small `clang`-compiled driver (as above).

### Shell utilities
`Shells/removeTailBlank.sh` uses BSD/macOS `sed -i ""` syntax; on Linux (GNU sed) drop the `""` argument (`sed -i`) or the command errors. This is a macOS-only script by design; do not "fix" it for Linux.
