/*
 * Given the value of each coin in the array of integers, take the minimum number of coins (no limit on the number of denominations) to make up the target amount.
 *
 input:
 coins = [1, 2, 3, 4]
 target = 10
 
 output:
 3
 
 Explanation:
 Two 4$, one 2$.
 *
 */

class Solution {
    
    func GetCoins(coins: [Int], target: Int) -> Int {
        var memo: [Int] = Array(0...target)
        for i:Int in memo {
            memo[i] = -2 // -1 no solution; -2 no calculation
        }
        memo[0] = 0
        return GetMemo(target: target, memo: &memo, coins: coins)
    }
    
    func GetMemo(target: Int, memo: inout [Int], coins: [Int]) -> Int {
        if (memo[target] != -2) {
            return memo[target]
        }
        var result = -1
        for coin in coins {
            if (target >= coin) {
                let temp = GetMemo(target: target - coin, memo: &memo, coins: coins)
                if (temp != -1 && (result == -1 || temp + 1 < result)) {
                    result = temp + 1
                }
            }
        }
        memo[target] = result
        return memo[target]
    }
}

var solution = Solution()
print(solution.GetCoins(coins: [1, 2, 3, 4], target: 10))
print(solution.GetCoins(coins: [1, 5, 10, 50], target: 128))
print(solution.GetCoins(coins: [100, 200, 500, 1000, 2000], target: 1024))
print(solution.GetCoins(coins: [1, 5, 10, 50, 100], target: 1024))

