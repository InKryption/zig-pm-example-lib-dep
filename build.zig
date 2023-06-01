const std = @import("std");
const Build = std.Build;

pub fn build(b: *Build) void {
    // Basically, this is just the same as in the zig-pm-example-lib repository.
    const dep_lib = b.addModule("zig-pm-example-lib-dep", .{
        .source_file = Build.FileSource.relative("dep.zig"),
    });

    const unit_tests = b.addTest(.{
        // Since we're using a test which references all decls, the test are also being used there
        .root_source_file = dep_lib.source_file,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
