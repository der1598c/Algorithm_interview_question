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

enum OrderType {
    case Pre_Order
    case In_Order
    case Post_Order
}

class Node {
    var value: Int!
    var left: Node?
    var right: Node?
    
    init(value:Int!) {
        self.value = value
    }
}

class Element {
    var type: Int! //0 visit; 1 output
    var node: Node!
    
    init(type:Int!, node: Node!) {
        self.type = type
        self.node = node
    }
}

struct Stack<T> {
    private var myArray: [T] = []

    mutating func push(_ element: T) {
        myArray.append(element)
    }

    mutating func pop() -> T? {
        return myArray.popLast()
    }

    func peek() -> T? {
        return myArray.last
    }

    func isEmpty() -> Bool! {
        if (myArray.count != 0) {
            return false
        }
        return true
//        if (peek() != nil) {
//            return false
//        }
//        return true
    }
    
    func getCount() -> Int! {
        return myArray.count
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
    
    func Traversal(root: Node!, order: OrderType) -> [Int] {
        var result = [Int]()
        var stack = Stack<Element>()
        stack.push(Element(type: 0, node: root))
        
        while (!stack.isEmpty()) {
            if let curr: Element = stack.pop() {
                if (curr.type == 1) {
                    result.append(curr.node.value)
                }
                else {
                    switch order {
                        case .Pre_Order:
                            if let rNode = curr.node.right {
                                stack.push(Element(type: 0, node: rNode))
                            }
                            if let lNode = curr.node.left {
                                stack.push(Element(type: 0, node: lNode))
                            }
                            stack.push(Element(type: 1, node: curr.node))
                            break
                        case .In_Order:
                            if let rNode = curr.node.right {
                                stack.push(Element(type: 0, node: rNode))
                            }
                            stack.push(Element(type: 1, node: curr.node))
                            if let lNode = curr.node.left {
                                stack.push(Element(type: 0, node: lNode))
                            }
                            break
                        case .Post_Order:
                            stack.push(Element(type: 1, node: curr.node))
                            if let rNode = curr.node.right {
                                stack.push(Element(type: 0, node: rNode))
                            }
                            if let lNode = curr.node.left {
                                stack.push(Element(type: 0, node: lNode))
                            }
                            break
                    }
                }
            }
        }
        return result
    }
}

var solution = Solution()
//test case 1
if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
    print(solution.Traversal(root: root, order: .Pre_Order))
    print(solution.Traversal(root: root, order: .In_Order))
    print(solution.Traversal(root: root, order: .Post_Order))
}
else {
    print(-1)
}

//test case 2
if let root = solution.BuildTree(nums: [3, 5, 6, -1, -1, 4, 0], pos: 0) {
    print(solution.Traversal(root: root, order: .Pre_Order))
    print(solution.Traversal(root: root, order: .In_Order))
    print(solution.Traversal(root: root, order: .Post_Order))
}
else {
    print(-1)
}

//test case 3
if let root = solution.BuildTree(nums: [1, 2, 3], pos: 0) {
    print(solution.Traversal(root: root, order: .Pre_Order))
    print(solution.Traversal(root: root, order: .In_Order))
    print(solution.Traversal(root: root, order: .Post_Order))
}
else {
    print(-1)
}
