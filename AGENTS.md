# AGENTS.md

## Cursor Cloud specific instructions

### 语言偏好
除非项目另有说明，所有面向用户的解释和文档一律使用中文输出。

### 本仓库是什么
`xcode_tool` 是一组 macOS/iOS 的 Objective-C 开发工具（详见 `README.markdown`）：
- `NSStringWrappeer/` —— 唯一可编译的模块：`NSString(Wrapper)` 分类（Java `String` 风格的方法），附带 Xcode 工程和单元测试（`NSStringWrapperTests.m`）。
- `Shells/` —— 独立的 bash 工具脚本（`removeTailBlank.sh`、`convertImage.sh`、`dailyBuild.sh`）。
- `CodeSnippets/`、`Macros/`、`Encoding/` —— 源码/代码片段，供拷贝进消费方 Xcode 工程使用。
- 根目录的 `*.sh` 脚本（`setup_snippets.sh`、`setup_reveal.sh` 等）是 macOS/Xcode 安装脚本，会操作 `~/Library/Developer/Xcode/...`。

仓库中**没有任何包管理清单**（无 npm/pip/go 等），也**没有可长期运行的服务**（无服务端、数据库或 Web 应用）。“运行应用”在这里指编译并运行 Objective-C 代码。

### 在 Linux 上构建与运行（本 VM 无 Xcode）
标准开发环境是 macOS + Xcode（`xcodebuild`），本 Linux VM 上不存在。因此改用 GNUstep + GCC Objective-C 运行时来编译并运行核心 Objective-C 代码。Ubuntu 的 GNUstep 包是基于 **GCC** 的 Objective-C 运行时构建的，所以要用 `clang -fobjc-runtime=gcc` 编译（不要用 `gnustep-2.0`）。

搭建过程中发现的非显而易见的坑：
- `objc/objc.h` 位于 `/usr/lib/gcc/x86_64-linux-gnu/13/include`（需用 `-I` 显式加入），默认不在 clang 搜索路径里。
- 没有 `/usr/lib/libobjc.so` 软链，需链接 GCC 那份：`-L/usr/lib/gcc/x86_64-linux-gnu/13 -lobjc`。
- `@"..."` 字符串字面量需要 `-fconstant-string-class=NSConstantString`。
- 自带的 GCC ObjC 前端过旧，不支持现代语法（`@autoreleasepool`、C99 for 循环），因此前端要用 `clang` 而非 `gcc`。

构建并运行一个调用 `NSString(Wrapper)` 的驱动程序：
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
（需自备一个 `main.m`，其中 `#import "NSStringWrapper.h"` 并调用分类的方法。）

### 测试
真正的测试（`NSStringWrappeer/NSStringWrapperTests/NSStringWrapperTests.m`）使用 Apple 的 SenTestingKit（`STAssert*` 宏），只能在 Xcode 下运行，无法在 Linux 上通过 GNUstep 执行。要在 Linux 上验证该库，可用一个 `clang` 编译的小驱动程序复现这些断言（如上）。

### Shell 工具
`Shells/removeTailBlank.sh` 使用 BSD/macOS 的 `sed -i ""` 语法；在 Linux（GNU sed）上需去掉 `""` 参数（`sed -i`），否则命令会报错。该脚本本就是 macOS 专用，不要为 Linux “修复”它。
