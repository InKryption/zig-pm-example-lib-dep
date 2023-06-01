pub fn isEven(comptime T: type, value: T) bool {
    return @mod(value, 2) == 0;
}

pub fn isOdd(comptime T: type, value: T) bool {
    return !isEven(T, value);
}

const testing = @import("std").testing;
test "is odd" {
    const odd_num_usize: usize = 5;
    const odd_num_isize: isize = -5;
    const odd_num_f64: f64 = 5.3;
    try testing.expect(isOdd(usize, odd_num_usize));
    try testing.expect(isOdd(isize, odd_num_isize));
    try testing.expect(isOdd(f64, odd_num_f64));

    try testing.expect(!isOdd(usize, odd_num_usize + 1));
    try testing.expect(!isOdd(isize, odd_num_isize + 1));
    try testing.expect(!isOdd(f64, odd_num_f64 + 0.7));
}

test "is even" {
    const even_num_usize: usize = 6;
    const even_num_isize: isize = -6;
    const even_num_f64: f64 = 6.0;
    try testing.expect(isEven(usize, even_num_usize));
    try testing.expect(isEven(isize, even_num_isize));
    try testing.expect(isEven(f64, even_num_f64));

    try testing.expect(!isEven(usize, even_num_usize + 1));
    try testing.expect(!isEven(isize, even_num_isize + 1));
    try testing.expect(!isEven(f64, even_num_f64 + 0.1));
}
