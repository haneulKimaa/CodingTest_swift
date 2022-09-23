import UIKit

var aArray: [Int] = [8,6,5,3,1,2,7,4]

// 버블 정렬 - 시간복잡도 O(n^2)
// 맨 앞부터 순서대로 다음 값과 비교하여 값이 더 크면 다음 값의 위치와 swap
private func bubbleSort() {
    var flag: Bool = false
    for i in 0..<aArray.count {
        flag = false
        for j in 0..<aArray.count-1-(i) { // 맨 뒤 완성된 원소 제외
            if aArray[j] > aArray[j+1] {
                aArray.swapAt(j, j+1)
                flag = true
            }
            print(aArray)
        }
        // 한 턴을 다 돌았는데도 바뀐게 없으면 정렬이 끝난 것
        if !flag {
            break
        }
    }
}

// 선택 정렬 - 시간복잡도 O(n^2)
// 맨 앞에서부터 정렬되지 않은 수 중에 가장 작은 수를 찾아서 본인의 자리와 swap
private func selectionSort() {
    
    for i in 0..<aArray.count {
        var minIndex: Int = i
        var minNum: Int = aArray[i]
        
        for j in i+1..<aArray.count {
            // minIndex부터 끝까지 중에 가장 작은 수 찾기
            if aArray[j] < minNum {
                minNum = aArray[j]
                minIndex = j
            }
        }
        aArray.swapAt(minIndex, i)
    }
    print(aArray)
}

// 삽입정렬 - 시간복잡도 O(n^2)
// 맨 앞부터 앞의 정렬된 수와 비교해서 크기대로 삽입
private func insertionSort(_ array: inout [Int]) -> [Int] {
    // i는 정렬할 인덱스
    for i in 1..<array.count {
        // 정렬된 수와 비교하는 연산
        // 정렬할 인덱스가 비교할 수보다 작으면
        for j in 0..<i {
            if array[i] < array[j] {
                let value = array[i]
                array.remove(at: i)
                array.insert(value, at: j)
            }
        }
    }
    return array
}

private func insertionSort2(_ array: inout [Int]) -> [Int] {
    // i가 정렬할 인덱스
    for i in 1..<array.count {
        for j in stride(from: i, to: 0, by: -1) {
            if array[j] < array[j-1] {
                array.swapAt(j-1, j)
            }
        }
    }
    return array
}

// 공간복잡도
// 팩토리얼 계산 - O(1)
private func factorial(n: Int) -> Int {
    var result: Int = 1
    for i in 1...n {
        result *= i
    }
    return result
}

// 팩토리얼 계산(재귀함수 이용) - O(N)
private func factorial2(n: Int) -> Int {
    if n > 1 {
        return n*factorial2(n: n-1)
    }
    else {
        return n
    }
}

// 재귀 용법 recursive call
var 특정값: Int = 1
private func recursiveCall1(입력값: Int) -> Int {
    if 입력값 > 특정값 {
        return recursiveCall1(입력값: 입력값-1)
    }
    else {
        return 입력값 // 또는 특정값
    }
}

private func recursiveCall2(입력값: Int) -> Int {
    if 입력값 <= 특정값 {
        return 입력값
    }
    recursiveCall2(입력값: 입력값-1)
    return 입력값 // 또는 특정값
}

private func recursiveFactorial1(n: Int) -> Int {
    if n > 1 {
        return n * recursiveFactorial1(n: n-1)
    }
    else {
        return n
    }
}

private func recursiveFactorial2(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return n * recursiveFactorial2(n: n-1)
}

// 피보나치 수열(recursive call) - 시간복잡도 O(2^n)
// n은 트리의 높이
// 피보나치4를 계산하려면 아래 fib를 8번 호출(연산도 8번)
private func fib(n: Int) -> Int {
    print("fib")
    if n <= 1 {
        return n
    }
    return fib(n: n-1) + fib(n: n-2)
}

// 동적 계획법 활용 피보나치 수열 - 시간복잡도O(n)
// dp 피보나치는 1번 호출, 연산 3번
var cache: [Int] = [0, 1]
private func dpFib(n: Int) -> Int {
    for i in 2...n {
        print("dpFib")
        cache.append(cache[i-1] + cache[i-2])
    }
    return cache[n]
}

// 퀵 정렬 - 시간 복잡도 O(nlog n), 최악의 경우 O(n^2)
// 차이가 큰 경우 평균으로 표시하기도 함
// i는 tree의 깊이
// 평균의 경우
// 1. 각 단계는 O(n)
// 각 단계에는 2^i개의 노드가 있고 n/2^i의 연산을 가짐)
// -> 각 단계의 연산은 둘을 곱해서 O(n)
// 2. 단계는 항상 logN개가 만들어지므로 // 2^i = N
// 총 연산 수는 단계 수(logN) x 각 단계 연산 수(n)
// 시간 복잡도 O(NlongN)
//
// 최악의 경우 (계속 가장 작은 값이 pivot이 되는 경우, 나머지 요소는 모두 right이 됨)
// 결국 모든 요소을 비교해봐야함 -> for 문이 두번 중첩된 경우와 같음
// O(n^2)

private func quickSort(_ array: [Int]) -> [Int] {
    var left: [Int] = []
    var right: [Int] = []
    if array.count <= 1 {
       return array
    }
    else {
        let pivot: Int = array[0]
        for i in 1..<array.count {
            if pivot < array[i] {
                right.append(array[i])
            }
            else {
                left.append(array[i])
            }
        }
        return quickSort(left) + [pivot] + quickSort(right)
    }
}

// 합병 정렬 (다시 풀어보기)
// 요소를 계속 divide 1개가 되면 각 요소를 비교하고 merge x 2 => 두 개를 merge
func mergeSort(array: [Int]) {
    func divide(array: [Int]) -> [Int] {
        // array의 원소 개수가 1일 때
        if array.count == 1 {
            return array
        }
        // array의 원소 개수가 1이 아닐 때 계속 divide
        let centerIndex: Int = array.count/2
        let left: [Int] = Array(array[0..<centerIndex])
        let right: [Int] = Array(array[centerIndex..<array.count])
        // left를 풀기 위해 원소 개수가 1일 때까지 나누고 1일 때 merge right도 반복..
        // 1. 왼쪽 divide -> 왼쪽devide(원소 1개) -> 오른쪽 devide(원소 1개) -> merge
        // 2. 오른쪽 divide -> 왼쪽devide(원소 1개) -> 오른쪽 devide(원소 1개) -> merge
        // merge(1, 2)
        return merge(left: divide(array: left), right: divide(array: right))
    }
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftArr = left
        var rightArr = right
        var mergedArray: [Int] = []
        while !leftArr.isEmpty && !rightArr.isEmpty {
            if leftArr.first! < rightArr.first! {
                mergedArray.append( leftArr.removeFirst() )
            }
            else {
                mergedArray.append( rightArr.removeFirst() )
            }
        }
        // left, right 중 하나라도 비었으면 나머지는 그대로 넣어줘도 됨(이미 sorting된 상태)
        mergedArray.append(contentsOf: leftArr + rightArr)
        return mergedArray
    }
    print(divide(array: aArray))
}



