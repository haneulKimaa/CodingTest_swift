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
// 시간 복잡도 O(Nlog N)
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

// 합병 정렬 (다시 풀어보기) - 시간복잡도 O(nlog n)
// 요소를 계속 divide 1개가 되면 각 요소를 비교하고 merge x 2 => 두 개를 merge
private func mergeSort(array: [Int]) {
    func divide(array: [Int]) -> [Int] { // 1이 될 때까지 반으로 나누기 -> log n
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
        while !leftArr.isEmpty && !rightArr.isEmpty { // 모든 수 비교 -> N
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
// 순차탐색 - 시간복잡도 O(n)
private func sequencialSearch(value: Int, array: [Int]) -> Bool {
    for i in 0..<array.count {
        if array[i] == value {
            return true
        }
    }
    return false
}

// 이진탐색 - 시간복잡도 O(log n)
// 이진탐색 - 재귀함수
private func binarySearchRecursive(value: Int, array: [Int]) {
    let selectedArray = array.sorted()
    var searchNum: Int = 1
    
    func search(array: [Int]) -> [Int] {
        let middleIndex = array.count/2
        var newArray: [Int] = []
        
        if array[middleIndex] == value {
            print("탐색 횟수", searchNum)
            return array
        }
        searchNum += 1
        newArray = array[middleIndex] < value ? Array(array[middleIndex+1]...array[array.count-1]) : Array(array[0]...array[middleIndex-1])
        return search(array: newArray)
    }
    search(array: selectedArray)
}

// 이진탐색 - 반복
private func binarySearch_Repetitive(value: Int, array: [Int]) -> Bool {
    let selectedArray = array.sorted()
    var searchNum: Int = 1
    var startIndex: Int = 0
    var endIndex: Int = selectedArray.count
    
    while startIndex != endIndex {
        let middleIndex = (startIndex + endIndex)/2
        searchNum += 1
        if selectedArray[middleIndex] == value {
            print(searchNum)
            return true
        }
        if selectedArray[middleIndex] > value {
            endIndex = middleIndex - 1
        }
        else {
            startIndex = middleIndex + 1
        }
    }
    print(searchNum)
    return true
}

// 그래프
// Swift Array를 큐처럼 사용
extension Array {
    mutating func enqueue(value: Element) {
        self.append(value)
    }
    mutating func dequeue() -> Element {
        return self.removeFirst()
    }
}

// 너비 우선 탐색
// 시간복잡도 O(V+E)
private func breadthFirstSearch(graph: [String: [String]], startValue: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [startValue]
    
    visitedQueueDequeue()
    
    /// 탐색할 값을 visitedQueue에 enqueue하고 근접 정점을 needVisitQueue에 넣음
    func visitedQueueDequeue() {
        /// visitedQueue에 추가할 값이  이미 없을 때만 enqueue
        while !needVisitQueue.isEmpty {
            if let needVisitQueuefirst = needVisitQueue.first {
                if !visitedQueue.contains(needVisitQueuefirst) {
                    visitedQueue.enqueue(value: needVisitQueue.dequeue())
                    needVisitQueue += graph[visitedQueue.last!]!
                }
                else {
                    needVisitQueue.dequeue()
                }
            }
        }
    }
    return visitedQueue
}

var graph: [String: [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D"],
    "C" : ["A", "G", "H", "I"],
    "D" : ["B", "E", "F"],
    "G" : ["C"],
    "H" : ["C"],
    "I" : ["C", "J"],
    "E" : ["D"],
    "F" : ["D"],
    "J" : ["I"]
]

// 깊이 우선 탐색
// 시간복잡도 O(V+E)
private func depthFirstSearch(graph: [String: [String]], startValue: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [startValue]
    
    visitedQueueDequeue()
    
    /// 탐색할 값을 visitedQueue에 enqueue하고 근접 정점을 needVisitQueue에 넣음
    func visitedQueueDequeue() {
        /// visitedQueue에 추가할 값이  이미 없을 때만 enqueue
        while !needVisitStack.isEmpty {
            if let needVisitQueueLast = needVisitStack.last {
                if !visitedQueue.contains(needVisitQueueLast) {
                    visitedQueue.enqueue(value: needVisitStack.popLast()!)
                    needVisitStack += graph[visitedQueue.last!]!
                }
                else {
                    needVisitStack.popLast()
                }
            }
        }
    }
    return visitedQueue
}

// 탐욕 알고리즘
/// 동전 문제 - 동전의 수를 가장 적게 해서 금액 채우기
private func greedyCoin(totalPrice: Int, count: Int) -> Int {
    var coinArray = [1, 50, 100, 500]
    var price = totalPrice
    var coinCount = count
    coinArray = coinArray.reversed()
    
    for coin in coinArray {
        coinCount += price/coin
        print(coin, price/coin)
        price = price%coin
    }
    return coinCount
}

/// 부분 베낭 문제
/// 무게 제한이 있는 베낭에 최대 가치를 가지도록 물건 넣기. 물건을 쪼갤 수 있음
/// 무게당 가치로 비교
private func greedyFractionalKnapsack(k: Int, thing: [(Double, Double)]) -> Double {
    
    var maxWeight = Double(k)
    var totalValue: Double = 0
    let sortedThings = thing.sorted { $0.1/$0.0 > $1.1/$1.0 }
    print(sortedThings)
    for i in sortedThings {
        if maxWeight >= i.0 {
            maxWeight -= i.0
            totalValue += Double(i.1)
            print(i)
        }
        else {
            totalValue += ((Double(maxWeight) / Double(i.0))*Double(i.1))
            print(i.0, (Double(maxWeight) / Double(i.0))*Double(i.1))
            break
        }
    }
    return totalValue
}


// 최단 경로 알고리즘
// 다익스트라 알고리즘

public struct NodePriority: Comparable {
    public static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority < rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}


public func dijkstra(start: String, graph: [String: [String : Int]]) -> [String : Int] {
    
    // 배열
    var result: [String : Int] = [:]
    // 우선순위 큐
    var priorityQueue = MinHeap.init(NodePriority(node: start, priority: 0))
    
    // 배열 초기값 세팅
    result[start] = 0
    for element in graph {
        result[element.key] = (element.key != start) ? Int.max : 0
    }
    
    // pop하고 그 노드의 근접노드를 우선순위 큐에 넣음. 다시 pop
    while !priorityQueue.heap.isEmpty {
        
        guard let popedNode = priorityQueue.pop() else {
            break
        }
        print("popedNode.node", popedNode.node)
        // pop한 노드의 인접노드를 result와 비교, 작은 값으로 바꾸고 우선순위 큐에 그 노드가 없을 시 insert
        for (node, priority) in graph[popedNode.node]! {
            let distance = popedNode.priority + priority
            if result[node]! > distance {
                result[node] = distance
                priorityQueue.insert(NodePriority(node: node, priority: distance))
            }
        }
    }
    return result
}

var graph2: [String: [String : Int]] = [
    "A" : ["B": 8, "C":1, "D":2],
    "B" : [:],
    "C" : ["B":5, "D":2],
    "D" : ["E":3, "F":5],
    "E" : ["F": 1],
    "F" : [:]
]

let vertices = ["A", "B", "C", "D"]
let edges = [
    (5,  "A", "B"),
    (1,  "A", "C"),
    (10, "A", "D"),
    (5,  "B", "A"),
    (3,  "B", "D"),
    (1,  "C", "A"),
    (8,  "C", "D"),
    (10, "D", "A"),
    (3,  "D", "B"),
    (8,  "D", "C"),
]

// 최소 신장 트리
// 1. 사이클 발생x, 모든 노드 연결 2. 최소 가중치 사용
// 크루스칼 알고리즘

typealias edge = (Int, String, String)
func kruskal(vertices: [String], edges: [edge]) -> [edge]{
    // 결과가 될 최소 신장 트리
    var mst: [edge] = []
    
    // 가중치 오름차 순으로 정렬
    var edges = edges.sorted { $0.0 < $1.0 }
    // union 시 사용할 rank
    var rank: [String: Int] = [:]
    // find 에서 찾을 루트 노드
    var parent: [String: String] = [:]
    
    // 1. rank, parent 초기화 (Union-find에서의 초기화)
    for vertex in vertices {
        // 각 노드가 자신의 부모노드가 됨
        parent.updateValue(vertex, forKey: vertex)
        rank.updateValue(0, forKey: vertex)
    }
    
    // 2. 루트 노드 리턴
    func find(_ node: String) -> String {
        // path compresion
        if node != parent[node] { // 현재 노드가 루트 노드가 아닐 때
            // 부모 노드에 루트 노드를 대입
            parent[node] = find(parent[node]!)
        }
        return parent[node]!
    }
    
    // 3. rank를 확인, union
    func union(_ nodeV: String, _ nodeU: String) {
        // 부모 노드
        let rootV = find(nodeV)
        let rootU = find(nodeU)
        
        // union-by-rank
        if rank[rootU]! > rank[rootV]! {
            parent[rootV] = rootU
        }
        else {
            parent[rootU] = rootV
            if rank[rootU] == rank[rootV] {
                rank[rootV]! += 1
            }
        }
    }
    
    while mst.count < (vertices.count - 1) {
        let node = edges.removeFirst()
        // 사이클이 없을 때
        if find(node.1) != find(node.2) {
            union(node.1, node.2)
            mst.append(node)
        }
    }
    
    return mst
}

struct Edge: Comparable {
    var start: String
    var dest: String
    var weight: Int
    
    init(_ start: String, _ dest: String, weight: Int) {
        self.start = start
        self.dest = dest
        self.weight = weight
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
}

let vertices2 = ["A", "B", "C", "D"]
let edges2: [Edge] = [
   .init("A", "B", weight: 5),
   .init("A", "C", weight: 1),
   .init("A", "D", weight: 10),
   .init("B", "A", weight: 5),
   .init("B", "D", weight: 3),
   .init("C", "A", weight: 1),
   .init("C", "D", weight: 8),
   .init("D", "A", weight: 10),
   .init("D", "B", weight: 3),
   .init("D", "C", weight: 8)
]

func prim(start: String, vertices: [String], edges: [Edge]) -> [Edge]? {
    var mst: [Edge] = []
    var edgeList = MinHeap<Edge>()
    var connectedNode: [String] = []
    var adjacentEdges: [String: [Edge]] = [:]
    
    for vertex in vertices {
        adjacentEdges.updateValue([], forKey: vertex)
    }
    
    for edge in edges {
        adjacentEdges[edge.start]?.append(edge)
    }
    
    // 시작 노드 세팅
    guard let startEdge = adjacentEdges[start] else {
        return nil
    }
    connectedNode.append(start)
    
    for edge in startEdge {
        edgeList.insert(edge)
    }
    
    while mst.count < vertices.count-1 {
        guard let popdedEdge = edgeList.pop() else {
            return nil
        }
        if !connectedNode.contains(popdedEdge.dest) {
            connectedNode.append(popdedEdge.dest)
            for edge in adjacentEdges[popdedEdge.dest]! {
                // 이미 연결되어있다면 어차피 위 if에서 선택되지 못함
                if !connectedNode.contains(edge.dest) {
                    edgeList.insert(edge)
                }
            }
            mst.append(popdedEdge)
        }
    }
    return mst
}


func backtracking(size: Int) -> Int {
    
    // index 가 x좌표
    var resultCoordinateArray = [Int].init(repeating: -1, count: size)
    var resultCount = 0
    
    func check(_ x: Int, _ y: Int) -> Bool {
        for i in 0..<x {
            if resultCoordinateArray[i] == y
                || abs(x-i) - abs(resultCoordinateArray[i] - y) == 0 {
                return false
            }
        }
        return true
    }
    
    // DFS
    func dfs(x: Int) {
        
        if x == size {
            resultCount += 1
            return
        }
        
        // x행의 y열을 돌면서 가능한지 확인
        for y in 0..<size {
            if check(x, y) {
                resultCoordinateArray[x] = y
                // 다음 행으로
                dfs(x: x+1)
                resultCoordinateArray[x] = -1
            }
        }
    }
    dfs(x: 0)
    return resultCount
}
print(backtracking(size: 4))
