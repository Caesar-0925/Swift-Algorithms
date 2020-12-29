import Foundation

public func minPatches(_ nums: Array<Int>, _ n: Int) -> Int {
    var patches = 0
    var x = 1
    var index = 0
    let len = nums.count
    
    while x <= n {
        if index < len && nums[index] <= x {
            x += nums[index]
            index += 1
        } else {
            x *= 2
            patches += 1
        }
    }
    
    return patches
}
