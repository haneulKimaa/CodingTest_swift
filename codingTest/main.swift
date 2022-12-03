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

// MARK: - 콜라 문제
func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var cokeCount = n
    var resultArray: [Int] = []
    var remainder: Int = 0
    while !resultArray.contains(0) {
        resultArray.append((Int(Double(cokeCount))/a) * b)
        remainder += cokeCount%a
        cokeCount = ((Int(Double(cokeCount))/a) * b) + cokeCount%a
    }
    return resultArray.reduce(0, +)
}

// MARK: - 삼총사
func solution(_ number:[Int]) -> Int {
    var result = 0
    for i in 0..<number.count-2 {
        for j in i+1..<number.count-1 {
            for k in j+1..<number.count {
                if (number[i] + number[j] + number[k]) == 0 {
                    result += 1
                }
            }
        }
    }
    return result
}

// MARK: - 숫자 짝꿍
func solution(X:String, _ Y:String) -> String {
    let xArray = X.map { Int(String($0))! }
    let yArray = Y.map { Int(String($0))! }
    var xDictionary: [Int: Int] = [:]
    var yDictionary: [Int: Int] = [:]
    var resultArray: [Int] = []
    
    for x in xArray {
        if xDictionary.keys.contains(x) {
            xDictionary.updateValue(xDictionary[x]! + 1, forKey: x)
        } else {
            xDictionary[x] = 1
        }
    }
    for y in yArray {
        if yDictionary.keys.contains(y) {
            yDictionary.updateValue(yDictionary[y]! + 1, forKey: y)
        } else {
            yDictionary[y] = 1
        }
    }
    for xValue in xDictionary {
        for yValue in yDictionary {
            if xValue.key == yValue.key {
                let count = xValue.value < yValue.value ? xValue.value : yValue.value
                for _ in 0..<count {
                    resultArray.append(xValue.key)
                }
            }
        }
    }
    
    if resultArray.isEmpty {
        return "-1"
    }
    if resultArray.filter({$0 != 0}).count == 0 {
        return "0"
    }
    
    resultArray.sort(by: >)
    return resultArray.map { String($0) }.joined()
}

// 다른 사람 풀이
func solution(_ X:String, _ Y:String) -> String {
    let xArray = Array(X)
    let yArray = Array(Y)
    let keys = Set(xArray).intersection(Set(yArray))
    var result = ""
    
    for key in keys.sorted(by: >) {
        result += String(repeating: key, count: min(xArray.filter{$0 == key}.count, yArray.filter{ $0 == key }.count))
    }
    
    return keys.count == 0 ? "-1" : (keys.count == 1 &&  keys.contains("0")) ? "0" : result.map {String($0)}.joined()
}

// MARK: - 성격 유형 검사하기
func solution(survey:[String], _ choices:[Int]) -> String {
    var resultDictionary: [String: Int] = [:]
    let choiceArray = choices.map { $0-4 }
    var resultArray: [String] = []
    
    let typeArray = ["R", "T", "C", "F", "J", "M", "A", "N"]
    for array in typeArray {
        resultDictionary[array] = 0
    }
    
    for i in 0..<survey.count {
        resultDictionary[survey[i].map { String($0) }[choiceArray[i] > 0 ? 1 : 0]]! += abs(choiceArray[i])
    }
    
    for i in stride(from: 0, to: typeArray.count, by: 2) {
        var result = resultDictionary[typeArray[i]]! > resultDictionary[typeArray[i+1]]! ? typeArray[i] : typeArray[i+1]
        if resultDictionary[typeArray[i]]! == resultDictionary[typeArray[i+1]]! {
            result = min(typeArray[i], typeArray[i+1])
        }
        resultArray.append(result)
    }
    return resultArray.joined()
}

// MARK: - 신고 결과 받기
func solution(id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedUserDictionary: [String: [String]] = [:]
    var resultDictionary: [String: Int] = [:]
    var resultArray: [Int] = []
    
    for string in id_list {
        reportedUserDictionary[string] = []
        resultDictionary[string] = 0
    }
    
    for issue in report {
        let users  = issue.split(separator: " ").map { String($0) }
        if !reportedUserDictionary[users[1]]!.contains(users[0]) {
            reportedUserDictionary[users[1]]!.append(users[0])
        }
    }
    
    for reportedUser in reportedUserDictionary {
        if reportedUser.value.count >= k {
            for sendUser in reportedUser.value {
                resultDictionary[sendUser]! += 1
            }
        }
    }
    
    for string in id_list {
        resultArray.append(resultDictionary[string]!)
    }
    return resultArray
}

// 다른 사람 풀이
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 신고자: 신고대상들
    var reported: [String: [String]] = [:]
    // 신고대상: 신고 횟수
    var resultDictionary: [String: Int] = [:]
    
    // set으로 중복 신고 제거
    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        reported[splited[0]] = (reported[splited[0]] ?? []) + [splited[1]]
        resultDictionary[splited[1]] = (resultDictionary[splited[1]] ?? 0) + 1
    }
    
    return id_list.map { (reported[$0] ?? []).reduce(0) {
        $0 + ((resultDictionary[$1] ?? 0) >= k ? 1 : 0)
    } }
}


// MARK: - 나머지가 1이 되는 수 찾기
func solution(_ n:Int) -> Int {
    var resultArray: Set<Int> = []
    let value = n - 1
    
    for i in 1..<Int(Double(value))/2 {
        if (value % i) == 0 {
            resultArray.insert(i)
            resultArray.insert(Int(Double(value))/i)
        }
    }
    return resultArray.filter { $0 != 1 }.sorted(by: <).first ?? 0
}

// 다른 사람 풀이
func solution(n:Int) -> Int {
    for i in 1..<n {
        if n % i == 1 {
            return i
        }
    }
    return n-1
}

// MARK: - 최소 직사각형
func solution(sizes:[[Int]]) -> Int {
    let sortedSizes = sizes.map { $0.sorted(by: >) }
    let wMax = sortedSizes.map { $0[0] }.max()!
    let hMax = sortedSizes.map { $0[1] }.max()!
    
    return wMax * hMax
}

// MARK: - 없는 숫자 더하기
func solution(numbers:[Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}

// MARK: - 부족한 금액 계산하기
func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    let result = money - (1...count).map { $0*price }.reduce(0, +)
    answer = result >= 0 ? 0 : Int64(abs(result))
    return answer
}

// 다른 사람 풀이
func solution(price:Int, _ money:Int, _ count:Int) -> Int64{
    let result = money - ((price * (count+1) * count)/2)
    return result >= 0 ? 0 : Int64(abs(result))
}

// MARK: - 숫자 문자열과 영단어
func solution(_ s:String) -> Int {
    var string = s
    var wordDictionary = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9,
    ]
    for word in wordDictionary {
        if string.contains(word.key) {
            string = string.replacingOccurrences(of: word.key, with: String(word.value))
        }
    }
    return Int(string)!
}

// MARK: - 약수의 개수와 덧셈
func solution(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    for n in left...right {
        let count = (1...n).filter{ n % $0 == 0 }.count
        answer += (count % 2 == 0 ? n : -n)
    }
    
    return answer
}
