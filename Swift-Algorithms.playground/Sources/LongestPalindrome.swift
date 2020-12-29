import Foundation

public func longestPalindrome(_ s: String) -> String {
    let len = s.count
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
    var ans = ""
    for l in 0 ..< len {
        for i in 0 ..< len - l {
            let j = i + l
            if l == 0 {
                dp[i][j] = true
            } else if l == 1 {
                /// 注意：在Swift中，String 数据结构没有便捷的下标访问方法和
                /// 字符串截取方法，需要自行实现
                dp[i][j] = s[i] == s[j]
            } else {
                dp[i][j] = (s[i] == s[j]) && dp[i + 1][j - 1]
            }
            if dp[i][j] && l + 1 > ans.count {
                ans = s.substring(i, i + l + 1)
            }
        }
    }
    
    return ans
}

extension String {
    subscript(_ i: Int ) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    func index(_ offset: Int ) -> Index {
        return self.index(self.startIndex, offsetBy: offset)
    }
    
    func substring(_ start: Int, _ end: Int) -> String {
        return String(self[self.index(start) ..< self.index(end)])
    }
}
