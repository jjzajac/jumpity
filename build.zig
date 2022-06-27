const std = @import("std");
const Sdk = @import("./SDL.zig/Sdk.zig");

const log = std.debug.print;

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    const sdk = Sdk.init(b);
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    //    log("test\n",.{target});

    const exe = b.addExecutable("jumpity", "src/main.zig");
    exe.setTarget(target);
    sdk.link(exe, .dynamic);
    exe.setBuildMode(mode);
    exe.addPackage(sdk.getWrapperPackage("sdl2"));
    exe.install();
}
