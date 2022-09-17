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

// 선택 정렬
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

