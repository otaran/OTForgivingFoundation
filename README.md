Tired of receiving crash reports because Foundation collection classes don't accept nil values? Suffer no more!

### NSArray

```
id nilValue = nil;
NSArray *numbers = @[@1, @2, nilValue]; // won't crash
NSAssert([numbers isEqualToArray:@[@1, @2]]);
```

### NSDictionary

```
id nilValue = nil;
NSDictionary *strings = @{
    @1: @"1",
    @2: @"2",
    @3: nilValue, // won't crash
};
NSAssert([strings isEqualToDictionary:@{
    @1: @"1",
    @2: @"2",
}]);
```
