/*
 * There are two already sorted integer arrays nums1, nums2, which merge the two arrays into nums1 and sort them.
 *
 input:
 nums1 = [4, 5, 7, 10, 0, 0, 0]
 length1 = 4
 
 nums2 = [3, 6, 11]
 length2 = 3
 
 output:
 [3, 4, 5, 6, 7, 10, 11]
 *
 */
class Solution {
    
    var nums1:[Int]?
    var nums2:[Int]?
    var length1:Int?
    var length2:Int?
    
    init (nums1:[Int]?, length1:Int?, nums2:[Int]?, length2:Int?){
        // it has a chance so its value can be set!
        self.nums1 = nums1
        self.nums2 = nums2
        self.length1 = length1
        self.length2 = length2
    }
    
    func MergeArray() {
        var pos1 = length1! - 1
        var pos2 = length2! - 1
        var last = nums1!.count - 1
        while (last != -1) {
            if (pos1 == -1 || (pos2 != -1 && nums1![pos1] < nums2![pos2] )) {
                nums1![last] = nums2![pos2]
                last -= 1
                pos2 -= 1
            }
            else {
                nums1![last] = nums1![pos1]
                last -= 1
                pos1 -= 1
            }
        }
    }
}

var solution = Solution(nums1: [4, 5, 7, 10, 0, 0, 0], length1: 4, nums2: [3, 6, 11], length2: 3)
solution.MergeArray()

print(solution.nums1!)

var solution2 = Solution(nums1: [4, 5, 6, 10, 15, 0, 0, 0, 0], length1: 5, nums2: [3, 7, 9, 14], length2: 4)
solution2.MergeArray()

print(solution2.nums1!)
