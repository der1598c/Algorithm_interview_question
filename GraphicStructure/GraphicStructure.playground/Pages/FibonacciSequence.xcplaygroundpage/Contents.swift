/*
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...
 * Calculate F(n)
 *
 input:
 n = 5
 
 output:
 5
 *
 */

class Solution {
    var memo: [Int]
    
    init() {
        self.memo = Array(0...1000)
        for i:Int in self.memo {
            self.memo[i] = -1
        }
        self.memo[0] = 0
        self.memo[1] = 1
    }
    
    func F1(n: Int) -> Int {
        if (self.memo[n] == -1) {
            self.memo[n] = F1(n: n - 1) + F1(n: n - 2)
        }
        return self.memo[n]
    }
    
    func F2(n: Int) -> Int {
        for i:Int in 2 ... n {
            self.memo[i] = self.memo[i - 1] + self.memo[i - 2]
        }
        return self.memo[n]
    }
}

var solution = Solution()
print(solution.F1(n: 14))
print(solution.F2(n: 14))

