/*
 * LetCode:979 https://leetcode.com/problems/distribute-coins-in-binary-tree/
 * Distribute Coins in Binary Tree.
 * Given the root of a binary tree with N nodes, each node in the tree has node.val coins, and there are N coins total.
 In one move, we may choose two adjacent nodes and move one coin from one node to another.  (The move may be from parent to child, or from child to parent.)
 Return the number of moves required to make every node have exactly one coin.
 
 input 1:
 [3,0,0]
 graph:
 3
 /  \
 0    0
 
 output 1:
 2
 
 explanation 1:
 From the root of the tree, we move one coin to its left child, and one coin to its right child.
 *
 */

/**
 * Note:
 * 1<= N <= 100
 * 0 <= node.val <= N
 * -1 represents nil, and a positive integer represents the value of the node (unique).
 [1,0,0,-1,3]
 graph:
 1
 /  \
 0    0
 \
 3
 
 */

/**
 * Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var ans: Int = 0
    
    func distributeCoins(_ root: TreeNode?) -> Int {
        
        dfs(node: root)
        return ans
    }
    
    func dfs(node: TreeNode?) -> Int {
        if let node = node {
            let L: Int = dfs(node: node.left)
            let R: Int = dfs(node: node.right)
            ans += abs(L) + abs(R)
            return node.val + L + R - 1
        }
        
        return 0
    }
    
    func BuildTree(nums: [Int], pos: Int) -> TreeNode? {
        if (pos >= nums.count || nums[pos] == -1) {
            return nil
        }
        let node = TreeNode(nums[pos])
        node.left = BuildTree(nums: nums, pos: pos * 2 + 1)
        node.right = BuildTree(nums: nums, pos: pos * 2 + 2)
        return node
    }
}

var solution = Solution()
//test case 1
if let root = solution.BuildTree(nums: [3,0,0], pos: 0) {
    print(solution.distributeCoins(root))
}

//test case 2
solution = Solution()
if let root = solution.BuildTree(nums: [0,3,0], pos: 0) {
    print(solution.distributeCoins(root))
}

//test case 3
solution = Solution()
if let root = solution.BuildTree(nums: [1,0,2], pos: 0) {
    print(solution.distributeCoins(root))
}

//test case 4
solution = Solution()
if let root = solution.BuildTree(nums: [1,0,0,-1,3], pos: 0) {
    print(solution.distributeCoins(root))
}

//test case 5
/*
 [1,0,3,0]
 graph:
 1
 /  \
 0    3
 /
 0
 */
solution = Solution()
if let root = solution.BuildTree(nums: [1,0,3,0], pos: 0) {
    print(solution.distributeCoins(root))
}
