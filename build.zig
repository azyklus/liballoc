const std = @import("std");

const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("liballoc", "lib/index.zig");
    lib.setBuildMode(mode);
    lib.install();

    const lib_tests = b.addTest("lib/tests.zig");
    lib_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
