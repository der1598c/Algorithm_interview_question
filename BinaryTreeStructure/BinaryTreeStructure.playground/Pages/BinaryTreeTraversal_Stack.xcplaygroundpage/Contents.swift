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
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value:Int!) {
        self.value = value
    }
}

class Element {
    var type: Int //0 visit; 1 output
    var node: Node
    
    init(type:Int!, node: Node!) {
        self.type = type
        self.node = node
    }
}

//class Stack<T>{
//    var elementes = [T]()
//    func push(element: T){
//        elementes.append(element)
//    }
//    func pop() -> T? {
//        if isEmpty {
//            return nil
//        }
//        return elementes.removeLast()
//    }
//    func peek() -> T? {
//        if isEmpty{
//            return nil
//        }
//        return elementes.last
//    }
//    var isEmpty: Bool{
//        if elementes.count == 0{
//            return true
//        }
//        return false
//    }
//}

//class Item<T> {
//    let itemVal : T
//    var next : Item?
//    var count : Int
//    init(value : T) {
//        self.itemVal = value
//        self.count = 0
//    }
//}
//
//class Stack<T> {
//    var top : Item<T>?
//
//    func push(_ value:T){
//        let oldTop = top
//        top = Item(value: value)
//        top?.next = oldTop
//        top?.count += 1
//        print("Push Item to Stack : \(value) ")
//    }
//
//    func pop() -> T?{
//        print("Popped Item from Stack : ")
//        let currentTop = top
//        top = top?.next
//        top?.count -= 1
//        return currentTop?.itemVal
//    }
//
//    func isEmpty() -> Bool! {
//        if (top!.count > 0) {
//            return false
//        }
//        return true
//    }
//}

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
    
    func Traversal(root: Node!) -> [Int] {
        var result = [Int]()
        var stack = Stack<Element>()
        stack.push(Element(type: 0, node: root))
        
        while (!stack.isEmpty()) {
            print("Stack count : \(String(describing: stack.getCount()))")
            if let curr: Element = stack.pop() {
                print("curr type : \(String(describing: curr.type)), value : \(String(describing: curr.node.value))")
                if (curr.type == 1) {
                    result.append(curr.node.value)
//                    print(result)
                }
                else {
                    stack.push(Element(type: 0, node: curr.node.right!))
                        print("Push value : \(String(describing: curr.node.right!.value))")
                    stack.push(Element(type: 0, node: curr.node.left!))
                        print("Push value : \(String(describing: curr.node.left!.value))")
                    stack.push(Element(type: 1, node: curr.node))
                        print("Push value : \(String(describing: curr.node.value))")
                }
            }
        }
        
        return result
    }
}

var solution = Solution()
//if let root = solution.BuildTree(nums: [1, 2, 3, -1, 4, 5, 6], pos: 0) {
//    print("Pre_Order :")
//    print(solution.Traversal(root: root))
//}
//else {
//    print(-1)
//}

if let root = solution.BuildTree(nums: [3, 5, 6], pos: 0) {
    print(root.value)
    print(root.left!.value)
    print(root.left!.left!.value)
    print(root.right!.value)
    print("Pre_Order :\n\(solution.Traversal(root: root))")
}
else {
    print(-1)
}
