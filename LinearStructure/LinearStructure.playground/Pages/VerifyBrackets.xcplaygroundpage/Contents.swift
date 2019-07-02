/*
 * Give a string containing parentheses to determine if it is correct.
 *
 input 1:
 equation = "([][]{})"
 
 output 1:
 true
 *
 *
 input 2:
 equation = "([)]"
 
 output 2:
 false
 *
 */

struct Stack {
    private var myArray: [Character] = []
    
    mutating func push(_ element: Character) {
        myArray.append(element)
    }
    
    mutating func pop() -> Character? {
        return myArray.popLast()
    }
    
    func isEmpty() -> Bool? {
        if (myArray.count != 0) {
            return false
        }
        return true
    }
    
    func size() -> Int? {
        return myArray.count
    }
    
    //    func peek() -> Character {
    //        guard let topElement = myArray.last else { print("This stack is empty.") }
    //        return topElement
    //    }
}

class Solution {
    
    func Check_1(equation : String) -> Bool {
        var stack = Stack()
        for c in Array(equation) {
            switch c {
            case "(":
                stack.push(c)
                break
            case "[":
                stack.push(c)
                break
            case "{":
                stack.push(c)
                break
            case ")":
                if (stack.isEmpty()! || stack.pop() != "(") {
                    return false
                }
                break
            case "]":
                if (stack.isEmpty()! || stack.pop() != "[") {
                    return false
                }
                break
            case "}":
                if (stack.isEmpty()! || stack.pop() != "{") {
                    return false
                }
                break
            default:
                break
            }
        }
        return stack.size() == 0
    }
    
    func Check_2(equation : String) -> Bool {
        var stack = Stack()
        for c in Array(equation) {
            switch c {
            case "(":
                stack.push(")")
                break
            case "[":
                stack.push("]")
                break
            case "{":
                stack.push("}")
                break
            default:
                if (stack.isEmpty()! || stack.pop() != c) {
                    return false
                }
                break
            }
        }
        return stack.size() == 0
    }
}

var solution = Solution()
print(solution.Check_1(equation: "([][]{})"))
print(solution.Check_2(equation: "([)]"))
print(solution.Check_1(equation: "{[][]()}"))
print(solution.Check_2(equation: "}"))
