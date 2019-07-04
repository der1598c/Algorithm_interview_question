/*
 * The course sequence is sequential (in an array), and it is possible to arrange the courses properly and complete the courses.
 *
 input:
 prerequisites = [ [1], [3], [3], [] ]
 
 explanation:
    There are four courses, numbered sequentially: 0, 1, 2, 3
    The 0 course is required for the first course.
    The first course requires the completion of the third course.
    The second course requires the completion of the third course.
    The third course is not required.
 
 output:
 true
 *
 */

public struct Queue<T> {
    fileprivate var array = [T]()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    public var front: T? {
        return array.first
    }
}

public class SNode<T> {
    var value: T
    var next: SNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class SingleLinkedList<T> {
    var head: SNode<T>? // head is nil when list is empty
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: SNode<T>? {
        return head
    }
    
    public func append(value: T) {
        let newNode = SNode(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
            
        } else {
            head = newNode
        }
    }
    
    func insert(data : T, at position : Int) {
        let newNode = SNode(value: data)
        
        if (position == 0) {
            newNode.next = head
            head = newNode
        }
        else {
            var previous = head
            var current = head
            for _ in 0..<position {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            previous?.next = newNode
        }
    }
    
    func deleteNode(at position: Int)
    {
        if head == nil{
            return
        }
        var temp = head
        
        if (position == 0)
        {
            head = temp?.next
            return
        }
        
        for _ in 0..<position-1 where temp != nil {
            temp = temp?.next
        }
        
        if temp == nil || temp?.next == nil{
            return
        }
        
        let nextToNextNode = temp?.next?.next
        
        temp?.next = nextToNextNode
    }
    
    func valueAtPosition(at position : Int) -> T {
        var node = head
        
        if (position == 0) {
            return head!.value
        }
        for _ in 1 ... position {
            node = node?.next
        }
        return node!.value
    }
    
    func printList() {
        var current: SNode? = head
        //assign the next instance
        while (current != nil) {
            print("LL item is: \(current?.value as? Int ?? 0)")
            current = current?.next
        }
    }
    
    
    func printReverseRecursive(node: SNode<T>?) {
        if node == nil{
            return
        }
        printReverseRecursive(node: node?.next)
        print("LL item is: \(node?.value as? Int ?? 0)")
    }
    
    func printReverse() {
        printReverseRecursive(node: first)
        
    }
}

class Solution {
    
    func ScheduleCourses(prerequisites: [[Int]]) -> Bool {
        var degree: [Int] = Array(0...prerequisites.count)
        var neighbors = [SingleLinkedList<Int>](repeatElement(SingleLinkedList<Int>(), count: prerequisites.count))
        var available = Queue<Int>()

        for id in 0..<prerequisites.count {
            neighbors[id] = SingleLinkedList<Int>()
            degree[id] = prerequisites[id].count
            if (degree[id] == 0) {
                available.enqueue(id)
            }
        }

        for from in 0..<prerequisites.count {
            for to in prerequisites[from] {
                neighbors[to].append(value: from)
            }
        }

        var count = 0
        while (!available.isEmpty) {
            print(available.front!)
            let av = available.dequeue()
//            for id in neighbors[av!] {
//                if (degree[id] == 0) {
//                    available.enqueue(id)
//                }
//            }
            var node = neighbors[av!].head
            while (node != nil) {
                let id = (node?.value)!
                degree[id] -= 1
                if (degree[id] == 0) {
                    available.enqueue(id)
                }
                node = node?.next
            }
            count += 1
        }
        return count == prerequisites.count
    }
}

var solution = Solution()
print(solution.ScheduleCourses(prerequisites: [[1], [3], [3], []]))
print(solution.ScheduleCourses(prerequisites: [[1], [0]]))
print(solution.ScheduleCourses(prerequisites: [[1], [0], []]))
