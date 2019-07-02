/*
 * There is an integer array of nums, from which two numbers are taken, making their sum equal to the target.
 *
   input 1:
   nums = [4, 5, 7, 10]
   target = 12
 *
   output 1:
   true
 *
 *
   input 2:
   nums = [4, 5, 7, 10]
   target = 8
 *
   output 2:
   false
 *
 */
class Solution {
    func FindTarget(nums:[Int], target:Int) -> Bool {
        var appeared = Set<Int>()
        for num in nums {
            if (appeared.contains(target - num)) {
                return true
            }
            else {
                appeared.insert(num)
            }
        }
        return false
    }
}

var solution = Solution()
var problem : [Int] = [4, 5, 7, 10]
//print(solution.FindTarget(nums: problem, target: 12))
//print(solution.FindTarget(nums: [4, 5, 7, 10], target: 8))
//print(solution.FindTarget(nums: [10, 4, 4, 1], target: 8))
//print(solution.FindTarget(nums: [10, 1, 2, 1, -1], target: 0))
print(solution.FindTarget(nums: [], target: 0))
