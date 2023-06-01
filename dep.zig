pub usingnamespace @import("src/main.zig");

test "test ref decls" {
    @import("std").testing.refAllDecls(@This());
}
