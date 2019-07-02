/*
 * Give an array of integers, separated by 0, 1 to find the first occurrence of 1.
 *
 input 1:
 nums = [0, 0, 0, 1, 1, 1, 1]
 
 output 1:
 3
 *
 *
 input 2:
 nums = [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
 
 output 2:
 2
 *
 */

class Solution {
    
    func FirstOne(nums: [Int]) -> Int {
        var left = 0
        var right = nums.count + 1
        
        if (nums.count == 0 || nums[nums.count - 1] == 0) {
            return -1
        }
        
        while (left < right) {
            let mid = left + (right - left) / 2
            if (nums[mid] == 1) {
                right = mid
            }
            else {
                left = mid + 1
            }
        }
        return left
    }
}

var solution = Solution()
print(solution.FirstOne(nums: [0, 0, 0, 1, 1, 1, 1]))
print(solution.FirstOne(nums: [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1]))
print(solution.FirstOne(nums: [1, 1, 1, 1, 1, 1]))
print(solution.FirstOne(nums: []))
