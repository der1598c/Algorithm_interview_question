/*
 * There is a binary tree with two nodes that find the nearest common parent of any two nodes.
 *
 input 1:
 root = [1, 2, 3, -1, 4, 5, 6]
 value1 = 5
 value2 = 6
 graph:
           1
         /  \
        2    3
       /\    /\
     nil 4  5  6
 -1 represents nil, and a positive integer represents the value of the node (unique).
 output 1:
 3
 *
 */

class Node {
    var value:Int
    var left:Node?
    var right:Node?
    
    init(value:Int!) {
        self.value = value
    }
}

class Solution {
    
    func BuildTree(nums: [Int], pos: Int) -> Node? {
        if (pos >= nums.count || nums[pos] == -1) {
            return nil
        }
        let node = Node(value: nums[pos])
        node.left = BuildTree(nums: nums, pos: pos * 2 + 1)
        node.right = BuildTree(nums: nums, pos: pos * 2 + 2)
        return node
    }
    
    func FindAncestor(root: Node!, value1: Int, value2: Int) -> Int {
        //No finding
        if (root === nil) {
            return -1
        }
        
        if (root.value == value1 || root.value == value2) {
            return root.value
        }
        
        let leftValue = FindAncestor(root: root.left, value1: value1, value2: value2)
        let rightValue = FindAncestor(root: root.right, value1: value1, value2: value2)
        
        //Finded 2
        if (leftValue != -1 && rightValue != -1) {
            return root.value
        }
        //Finded 0 or 1
        else {
            return leftValue + rightValue + 1
        }
    }
}

var solution = Solution()
if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
//    print(root.value)
//    print(root.right!.value)
    print(solution.FindAncestor(root: root, value1: 5, value2: 6))
}
else {
    print(-1)
}
if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6, -1, -1, 7, 8], pos: 0) {
    print(solution.FindAncestor(root: root, value1: 7, value2: 8))
    /*
     graph:
           1
         /  \
        2    3
       /\    /\
     nil 4  5  6
        /\
       7  8
     */
}
else {
    print(-1)
}
if let root = solution.BuildTree(nums: [1, 2, 3, 7, 4, 5, 6, 8, 9], pos: 0) {
    print(solution.FindAncestor(root: root, value1: 8, value2: 6))
}
else {
    print(-1)
}

