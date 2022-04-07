//
//  main.swift
//  codingTest
//
//  Created by 김하늘 on 2021/06/06.
//
//
//
// 백준 단계별 풀이
// 1. 입출력과 사칙연산
// 2. if문
// 3. for문
// 4. while문


// 1008번
//let line = readLine()
//let arr = line?.split(separator: " ").map({Double($0)})
//
//if let arr1 = arr?[0], let arr2 = arr?[1] {
//    // print(arr1/arr2)
//}

// 10869번
//let line  = readLine()
//let arr = line?.split(separator: " ").map({Int($0)})
//if let arr1 = arr?[0], let arr2 = arr?[1] {
//    print(arr1+arr2)
//    print(arr1-arr2)
//    print(arr1*arr2)
//    print(arr1/arr2)
//    print(arr1%arr2)
//}

// 10430번
//let line = readLine()
//let arr = line?.split(separator: " ").map({Int($0)})
//if let arr1 = arr?[0], let arr2 = arr?[1], let arr3 = arr?[2] {
//    print((arr1+arr2)%arr3)
//    print(((arr1%arr3) + (arr2%arr3))%arr3)
//    print((arr1*arr2)%arr3)
//    print(((arr1%arr3) * (arr2%arr3))%arr3)
//}

// 2588번 (8초)
//let line = readLine()
//let line2 = readLine()
//let firstNum: Int
//let secondNum: Int
//if let lineText = line, let line2Text = line2 {
//    firstNum = Int(lineText)!
//    secondNum = Int(line2Text)!
//    print(firstNum * ((secondNum%10)))
//    print(firstNum * ((secondNum/10)%10))
//    print(firstNum * ((secondNum/100)))
//    print(firstNum*secondNum)
//}

// 2588번 - 2 (8초)
//let line = Int(readLine()!)!
//let line2 = Int(readLine()!)!
//var line2Use = line2
//
//while line2Use != 0 {
//    print(line*(line2Use%10))
//    line2Use /= 10
//}
//print(line * line2)

// 1330번
//let lineArr = readLine()?.split(separator: " ").map({Int($0)})
//if lineArr![0]! > lineArr![1]! {
//    print(">")
//}
//else if lineArr![0]! == lineArr![1]! {
//    print("==")
//}
//else {
//    print("<")
//}

// 9498번 (8초)
//let line = Int(readLine()!)!
//if line >= 90 {
//    print("A")
//}
//else if line >= 80 {
//    print("B")
//}
//else if line >= 70 {
//    print("C")
//}
//else if line >= 60 {
//    print("D")
//}
//else {
//    print("F")
//}

// 9498번 - 2 (8초)
//let line = Int(readLine()!)!
//switch line {
//case 90...100:
//    print("A")
//case 80...89:
//    print("B")
//case 70...79:
//    print("C")
//case 60...69:
//    print("D")
//default:
//    print("F")
//}

// 2753번
//let line = Int(readLine()!)!
//if ((line%4 == 0) && (line%100 != 0)) || (line%400 == 0) {
//    print("1")
//}
//else {
//    print("0")
//}

// 14681번
//let line = Int(readLine()!)!
//let line2 = Int(readLine()!)!
//
//if line > 0 && line2 > 0 {
//    print("1")
//}
//else if line < 0 && line2 > 0 {
//    print("2")
//}
//else if line < 0 && line2 < 0 {
//    print("3")
//}
//else {
//    print("4")
//}

// 2884번
//let line = readLine()!.split(separator: " ").map({ Int($0)})
//var a = line[0]!
//var b = line[1]!
//
//if b >= 45 {
//    b -= 45
//}
//else {
//    if a == 0 {
//        a = 23
//        b = b + 60 - 45
//    }
//    else {
//        a -= 1
//        b = b + 60 - 45
//    }
//}
//print("\(a) \(b)")

// 2739번
//let line = Int(readLine()!)!
//for i in 1...9 {
//    print("\(line) * \(i) = \(line*i)")
//}

// 10950
//let num = Int(readLine()!)!
//for _ in 1...num {
//    let line = readLine()!.split(separator: " ").map({Int($0)})
//    print(line[0]! + line[1]!)
//}

// 8393번
//let line = Int(readLine()!)!
//var sum = 0
//for i in 1...line {
//    sum += i
//}
//print(sum)

// 8393번 - 2
//let line = Int(readLine()!)!
//print((line*(line+1))/2)
//
// ------------------------------------------------------------------
// 15552번 (시간초과 실패)
//let line = Int(readLine()!)!
//for _ in 1...line {
//    let line2 = readLine()!.split(separator: " ").map({Int($0)})
//    print(line2[0]! + line2[1]!)
//}
// ------------------------------------------------------------------

// 2741
//let line = Int(readLine()!)!
//for i in 1...line {
//    print(i)
//}

// 2742
//let line = Int(readLine()!)!
//for i in 0...line-1 {
//    print(line-i)
//}

// 2742 - 2
//for i in stride(from: Int(readLine()!)!, to: 0, by: -1) {
//    print(i)
//}

// 2742 - 3
//let line = Int(readLine()!)!
//let array = Array(1...line).reversed()
//for i in array {
//    print(i)
//}

// 11021
//let line = Int(readLine()!)!
//for i in 1...line {
//    let line2 = readLine()!.split(separator: " ").map({Int($0)!})
//    print("Case #\(i): \(line2[0] + line2[1])")
//}

// 11022
//let line = Int(readLine()!)!
//for i in 1...line {
//    let line2 = readLine()!.split(separator: " ").map({Int($0)!})
//    print("Case #\(i): \(line2[0]) + \(line2[1]) = \(line2[0] + line2[1])")
//}

// 2438
//let line = Int(readLine()!)!
//for i in 1...line {
//    var str: String = ""
//    for _ in 1...i {
//        str.append("*")
//    }
//    print(str)
//}

// 2439
//let line = Int(readLine()!)!
//for i in 1...line {
//    var str: String = ""
//    if i != line {
//        for _ in 1...line-i {
//            str.append(" ")
//        }
//    }
//    for _ in 1...i {
//        str.append("*")
//    }
//    print(str)
//}

// 2439 - 2
// stride를 사용한 경우
//let line = Int(readLine()!)!
//for i in 1...line {
//    var str = ""
//    for _ in stride(from: line, to: i, by: -1) {
//        str.append(" ")
//    }
//    for _ in stride(from: 0, to: i, by: 1) {
//        str.append("*")
//    }
//    print(str)
//}
//
// 2439 - 3
// print terminator
//let line = Int(readLine()!)!
//for i in 1...line {
//    for _ in 0..<line-i {
//        print(" ", terminator: "")
//    }
//    for _ in 1...i {
//        print("*", terminator: "")
//    }
//    print("")
//}
//
// 2439 - 4
//let line = Int(readLine()!)!
//for i in 1...line {
//    for _ in stride(from: 1, to: line+1-i, by: 1) {
//        print(" ", terminator: "")
//    }
//    for _ in stride(from: 1, to: i+1, by: 1) {
//        print("*", terminator: "")
//    }
//    print("")
//}
//
// 2439 - 5
//let line = Int(readLine()!)!
//for i in 1...line {
//    for _ in 0..<line-i {
//        print(" ", terminator: "")
//    }
//    for _ in 1..<i+1 {
//        print("*", terminator: "")
//    }
//    print("")
//}
//
// 10871
//let line = readLine()!.split(separator: " ").map({ Int( $0 )!})
//let line2 = readLine()!.split(separator: " ").map({ Int( $0 )!})
//for i in 0...line2.count-1 {
//    if line2[i] < line[1] {
//        print(line2[i], terminator: " ")
//    }
//}
//
// 10871 - 2
//let line = readLine()!.split(separator: " ").map( { Int($0)!} )
//let line2 = readLine()!.split(separator: " ").map( { Int($0)!} )
//let result = line2.filter( { $0 < line[1] } )
//for i in 0...result.count-1 {
//    print(result[i], terminator: " ")
//}
//
// 10871 - 3
//let line = readLine()!.split(separator: " ").map( { Int($0)!} )
//let line2 = readLine()!.split(separator: " ").map( { Int($0)!} )
//let result = line2.filter( { $0 < line[1] } ).map({ "\($0)" }).joined(separator: " ")
//print(result)

// 10952
//while true {
//    let line = readLine()!.split(separator: " ").map({Int($0)!})
//    if line[0] == 0 && line[1] == 0 {
//        break
//    }
//    print(line[0] + line[1])
//}
//
// 10951
// EOF가 발생하면 readline은 false가 되고 반복이 break된다.
//while let line = readLine() {
//    let number = line.split(separator: " ").map({Int($0)!})
//    print(number[0] + number[1])
//}
//
// 1110
// 다시 풀기
//var count: Int = 0
//var number: Int = 0
//
//var line = Int(readLine()!)!
//let firstLine = line
//while true {
//    var leftNum = line/10
//    var rightNum = line%10
//    number = (leftNum + rightNum)%10 + rightNum*10
//    line = number
//    count += 1
//    if firstLine == number {
//        break
//    }
//}
//print(count)



// 10926
//var line = readLine()!
//print("\(line)??!")


// 18108
//var line = Int(readLine()!)! - 543
//print(line)

// 2525
//var time = readLine()!.split(separator: " ").map({
//    Int($0)!
//})
//var plusTime = Int(readLine()!)!
//var hour: Int = 0
//var minute: Int = 0
//
//if time[1] + plusTime >= 60 {
//    
//    hour = time[0] + (time[1] + plusTime) / 60
//    minute = (time[1] + plusTime) % 60
//
//    if hour == 24 {
//        hour = 0
//    }
//    else if hour > 24 {
//        hour = hour % 24
//    }
//}
//else {
//    hour = time[0]
//    minute = time[1] + plusTime
//}
//print("\(hour) \(minute)")


// 2480
//var number = readLine()
//var num = number!.split(separator: " ").map {Int($0)!}
//var price = 0
//var count = 0
//var a: Set<Int> = []
//a.insert(num[0])
//a.insert(num[1])
//a.insert(num[2])
//count = a.count
//
//if count == 3{
//    price = num.max()! * 100
//}
//else if count == 2{
//    var c = 1
//    if num[0] == num[1] {
//        c = num[0]
//    }
//    else if num[1] == num[2] {
//        c = num[1]
//    }
//
//    else if num[0] == num[2] {
//        c = num[0]
//    }
//    price = 1000 + c * 100
//}
//
//else {
//    price = num[0] * 1000 + 10000
//
//}
//print(price)


// 2775 - 런타임 에러
//var count = Int(readLine()!)!
//var k: [Int] = []
//var n: [Int] = []
//
//for _ in 0..<count {
//    var a = Int(readLine()!)!
//    k.append(a)
//    var b = Int(readLine()!)!
//    n.append(b)
//}
//
//var zerofloor: [Int] = []
//var nextfloor: [Int] = []
//
//
//for i in 1...14 {
//    zerofloor.append(i)
//}
//
//func howManyPeople(floor: Int, room: Int) {
//    for _ in 0..<floor {
//        var a: Int = 1
//        for j in 0..<room {
//
//            if j == 0 {
//                nextfloor.append(1)
//            }
//            else {
//                a += zerofloor[j]
//                nextfloor.append(a)
//            }
//        }
//        zerofloor = nextfloor
//    }
//    print(nextfloor.last!)
//}
//
//for i in 0..<count {
//    howManyPeople(floor: k[i], room: n[i])
//}

// 성공
//var count = Int(readLine()!)!
//var k: [Int] = []
//var zerofloor: [Int] = []
//var nextfloor: [Int] = []
//
//
//for _ in 0..<count {
//    let a = Int(readLine()!)!
//    let b = Int(readLine()!)!
//
//    zerofloor.removeAll()
//    for i in 1...14 {
//        zerofloor.append(i)
//    }
//    if a == 0 {
//        k.append(b)
//    }
//    else {
//        for _ in 0..<a {
//
//            var sum: Int = 1
//            nextfloor.removeAll()
//
//            for j in 0..<b {
//                if j == 0 {
//                    nextfloor.append(1)
//                }
//                else {
//                    sum += zerofloor[j]
//                    nextfloor.append(sum)
//                }
//            }
//            zerofloor = nextfloor
//        }
//        k.append(nextfloor.last!)
//    }
//
//}
//for i in 0..<k.count {
//    print(k[i])
//}

// 2차원 배열 - 실패
//let count = Int(readLine()!)!
//
//var array: [[Int]] = [[]]
//var result: [Int] = []
//
//for _ in 0...count-1 {
//    let floor: Int = Int(readLine()!)!
//    let room: Int = Int(readLine()!)!
//
//
//    for j in 1...14 {
//        array[0].append(j)
//    }
//    for f in 1..<floor {
//            var sum = 0
//            for r in 0..<room-1 {
//                if room == 1 {
//                    array[f].append(1)
//                }
//                else {
//
//                    sum += array[f-1][r]
//                    array.append([])
//                    array[f].append(sum)
//                }
//            }
//        }
//    print(array)
//    result.append((array.last?.last)!)
//}
//
//for i in 0..<count {
//    print(result[i])
//}
