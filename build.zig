const std = @import("std");

const raylibBuild = @import("raylib");

pub fn build(b: *std.Build) !void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "sample-raylib-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Add raylib library and link with your executable. This is the only raylib boilerplate.
    // Everything else in this file is standard Zig build system setup.
    const raylib = try raylibBuild.addRaylib(b, target, optimize, .{
        // Optional - build & link raygui.
        .raygui = true,
    });
    exe.linkLibrary(raylib);

    b.installArtifact(exe);

    const runCmd = b.addRunArtifact(exe);
    runCmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        runCmd.addArgs(args);
    }
    const runStep = b.step("run", "Run the app");
    runStep.dependOn(&runCmd.step);
}
