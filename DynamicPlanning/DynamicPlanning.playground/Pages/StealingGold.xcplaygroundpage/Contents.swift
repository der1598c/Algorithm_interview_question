/*
 * There are four rooms, the value of gold is the value of the array of integers, and the neighboring houses cannot be stolen continuously.
 *
 Input:
 House = [3, 5, 2, 10]
 
 Output:
 15
 *
 */

class Solution {
    
    func GetGold(houses: [Int]) -> Int {
        var memo: [Int] = Array(0...houses.count - 1)
        for i:Int in memo {
            memo[i] = -1
        }
        return GetMemo(id: 0, memo: &memo, houses: houses)
    }
    
    func GetMemo(id: Int, memo: inout [Int], houses: [Int]) -> Int {
        if (id >= memo.count) {
            return 0
        }
        if (memo[id] != -1) {
            return memo[id]
        }
        let selectFirstElement: Int = houses[id] + GetMemo(id: id + 2, memo: &memo, houses: houses)
        let unselectFirstElement: Int = GetMemo(id: id + 1, memo: &memo, houses: houses)
        
        memo[id] = max(selectFirstElement, unselectFirstElement)
        return memo[id]
    }
}

var solution = Solution()
print(solution.GetGold(houses: [3, 5, 2, 10]))
print(solution.GetGold(houses: [8, 5, 4, 10, 9]))
print(solution.GetGold(houses: [5, 4, 9]))

