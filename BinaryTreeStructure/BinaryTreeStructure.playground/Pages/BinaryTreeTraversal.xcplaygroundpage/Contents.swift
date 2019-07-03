/*
 * Give an array of integers.
 * Binary tree traversal by order(Pre_Order, In_Order, Post_Order).
 *
 input 1:
 root = [1, 2, 3, -1, 4, 5, 6]
 graph:
       1
     /  \
    2    3
   /\    /\
 nil 4  5  6
 -1 represents nil, and a positive integer represents the value of the node (unique).
 output 1:
 [1, 2, 4, 3, 5, 6]
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

enum OrderType {
    case Pre_Order
    case In_Order
    case Post_Order
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
    
    func Traversal(root: Node!, orderType: OrderType) -> [Int] {
        var result = [Int]()
        switch orderType {
            case .Pre_Order:
                PreOrderTraversal(root: root, result: &result)
            case .In_Order:
                InOrderTraversal(root: root, result: &result)
            case .Post_Order:
                PostOrderTraversal(root: root, result: &result)
        }
        
        return result
    }
    
    func PreOrderTraversal(root: Node!, result: inout [Int]) {
        if (root == nil) {
            return
        }
        result.append(root.value)
        PreOrderTraversal(root: root.left, result: &result)
        PreOrderTraversal(root: root.right, result: &result)
    }
    
    func InOrderTraversal(root: Node!, result: inout [Int]) {
        if (root == nil) {
            return
        }
        InOrderTraversal(root: root.left, result: &result)
        result.append(root.value)
        InOrderTraversal(root: root.right, result: &result)
    }
    
    func PostOrderTraversal(root: Node!, result: inout [Int]) {
        if (root == nil) {
            return
        }
        PostOrderTraversal(root: root.left, result: &result)
        PostOrderTraversal(root: root.right, result: &result)
        result.append(root.value)
    }
}

var solution = Solution()
if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
    print("Pre_Order :")
    print(solution.Traversal(root: root, orderType: OrderType.Pre_Order))
}
else {
    print(-1)
}

if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
    print("In_Order :")
    print(solution.Traversal(root: root, orderType: OrderType.In_Order))
}
else {
    print(-1)
}

if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
    print("Post_Order :")
    print(solution.Traversal(root: root, orderType: OrderType.Post_Order))
}
else {
    print(-1)
}
