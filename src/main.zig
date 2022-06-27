const std = @import("std");
const SDL = @import("sdl2");
//const SDL = @import("../SDL.zig/src/wrapper/sdl.zig");

pub fn main() anyerror!void {
    try SDL.init(.{
        .video = true,
        .events = true,
    });
    defer SDL.quit();

    var win = try SDL.createWindow("Jumpity", .{ .centered = .{} }, .{ .centered = .{} }, 800, 600, .{ .shown = true });
    defer win.destroy();

    var rend = try SDL.createRenderer(win, null, .{ .accelerated = true });
    defer rend.destroy();

    mainLoop: while (true) {
        while (SDL.pollEvent()) |ev| {
            switch (ev) {
                .quit => break :mainLoop,
                else => {},
            }
        }

        try rend.setColorRGB(0xF7, 0xA4, 0x1D);
        try rend.clear();

        rend.present();
    }
}
