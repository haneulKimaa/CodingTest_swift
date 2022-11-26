//
//  main.swift
//  codingTest
//
//  Created by 김하늘 on 2022/11/25.
//

import Foundation

// MARK: - 명예의 전당
//let readline = readLine()!.replacingOccurrences(of: " ", with: "").split(separator: "[")
//let k = Int(readline[0].replacingOccurrences(of: ",", with: ""))!
//let array = readline[1].replacingOccurrences(of: "]", with: "").split(separator: ",").map { Int($0)! }

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var resultArray: [Int] = [score[0]]
    
    // 전체 중에 가장 작은 것 추가
    var compare: Int = 1 // 날짜+1
    
    if k >= score.count {
        while compare < score.count {
            resultArray.append(score[0...compare].min()!)
            compare += 1
        }
    }
    else {
        while compare < k {
            resultArray.append(score[0...compare].min()!)
            compare += 1
        }
        // 명예의 전당 중 가장 작은 것 추가
        while compare < score.count {
            // 날짜 계산
            let sortedScore = score[0...compare].sorted(by: >)
            resultArray.append(sortedScore[k-1])
            compare += 1
        }
    }
    return resultArray
}

// 다른 사람 풀이
func solution2(_ k:Int, _ score:[Int]) -> [Int] {
    return (0...score.count-1).map {
        let end = $0 < k-1 ? $0 : k-1 // 마지막 인덱스를 계산
        return Array(score[0...$0].sorted(by: >))[end]!
    }
}

// MARK: - 기사단원의 무기
// 시간 초과
func solution3(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    var divisorCount = 0
    for i in 1...number {
        // 약수 개수 구하기
        var array: [Int] = []
        for j in 1...i {
            if (j * j) <= i && i % j == 0 { // 같은 값이 나오는 것을 없앰
                if j*j != i {
                    array.append(i / j)
                }
                array.append(j)
            }
        }
        divisorCount = i != 1 ? array.count : 1
        result += divisorCount > limit ? power : divisorCount
    }
    return result
}

// 다른 사람 풀이
func solution4(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var array = [Int](repeating: 0, count: number+1)

    // 약수 개수 구하기
    for i in 1...number {
        var c = i

        while c <= number {
            array[c] += 1
            c += i
        }
    }
    return array.map { $0 > limit ? power : $0 }.reduce(0, +)
}

// MARK: - 과일 장수
func solution5(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    if score.count < m {
        return 0
    }
    let sortedScore = score.sorted(by: >)[0...(score.count-score.count%m)-1]
    var result = 0
    
    for i in stride(from: 0, to: sortedScore.count, by: m) {
        result += (sortedScore[i...i+m-1].min()! * m)
    }
    return result
}

// MARK: - 푸드 파이터 대회

func solution(_ food:[Int]) -> String {
    var foodArray = food
    var front: [Int] = []
    
    for i in 1..<foodArray.count {
        foodArray[i] /= 2
        for _ in 0..<foodArray[i] {
            front.append(i)
        }
    }
    return (front + Array(arrayLiteral: 0) + front.reversed()).map { String($0) }.joined()
}


// 다른 사람 풀이
func solution2(_ food:[Int]) -> String {
    var result: String = ""
    for i in 1..<food.count {
        result += String(repeating: String(i), count: food[i] / 2)
    }
    return result + "0" + result.reversed()
}

// MARK: - 햄버거 만들기
func solution6(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var result: Int = 0
    
    for i in 0..<ingredient.count {
        stack.append(ingredient[i])
    
        if stack.count >= 4 {
            if stack[stack.count-4...stack.count-1] == [1, 2, 3, 1] {
                stack.removeSubrange(stack.count-4...stack.count-1)
                result += 1
            }
        }
    }
    return result
}
// 다른 사람 풀이
func solution7(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var result: Int = 0
    
    for i in 0..<ingredient.count {
        stack.append(ingredient[i])
        if stack.suffix(4) == [1, 2, 3, 1] {
            stack.removeLast(4)
            result += 1
        }
    }
    return result
}

// MARK: - 옹알이
func solution(_ babbling:[String]) -> Int {
    let tallable = ["aya", "ye", "woo", "ma"]
    var result: Int = 0
    
    for babble in babbling {
        var word = ""
        var lastWord = ""
        
        babble.map {
            word += String($0)
            if tallable.contains(word) && lastWord != word{
                lastWord = word
                word = ""
            }
        }
        if word.isEmpty {
            result += 1
        }
        
    }
    return result
}

