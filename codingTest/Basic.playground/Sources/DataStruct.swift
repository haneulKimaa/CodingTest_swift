import Foundation

// 이진 트리 노드
public class Node<T: Comparable> { // 비교 가능한 제네릭 데이터
    var data: T
    var left: Node?
    var right: Node?
    
    public init(data: T) {
        self.data = data
    }
}

// 이진 탐색 트리
public class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    public init(root: Node<T>? = nil) {
        self.root = root
    }
    
    // insert
    public func insert(_ data: T) {
        // 1. 루트가 있는지 확인
        guard let root = root else {
            // 없으면 루트로 지정
            return self.root = Node.init(data: data)
        }
        // 루트가 있으면 루트 노드부터 탐색
        var currentNode = root
        
        while true {
            if currentNode.data > data {
                // 2. 왼쪽 노드가 있는지 확인
                guard let leftNode = currentNode.left else {
                    // 왼쪽 노드가 없다면
                    return currentNode.left = Node.init(data: data)
                }
                // 왼쪽 노드가 있다면
                currentNode = leftNode
            }
            else {
                // 오른쪽 노드가 있는지 확인
                guard let rightNode = currentNode.right else {
                    // 오른쪽 노드가 없다면
                    return currentNode.right = Node.init(data: data)
                }
                // 오른쪽 노드가 있다면
                currentNode = rightNode
            }
        }
    }
    
    // remove (성공한 경우 true)
    public func remove(_ data: T) -> Bool {
        
        guard let root = root else {
            return false
        }
        // 삭제할 데이터가 담길 변수. 루트부터 탐색
        var currentNode: Node? = root
        // 부모 노드가 담길 변수
        var parentNode: Node? = root
        
        // 삭제할 노드 탐색
        while let node = currentNode {
            if node.data == data { break }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
            parentNode = node
        }
        if let node = currentNode {
            // 1. 탐색 성공
            // 1-1. 자식이 없는 경우
            if node.left == nil && node.right == nil {
                if parentNode!.data > node.data {
                    parentNode!.left = nil
                } else {
                    parentNode!.right = nil
                }
            }
            
            // 1-2. 자식이 하나일 경우
            ///  오른쪽 자식이 있을 때
            if node.left == nil && node.right != nil {
                /// 부모의  왼쪽 자식일 경우
                if parentNode!.data > node.data {
                    parentNode!.left = node.right
                }
                else {
                    /// 부모의  오른쪽 자식일 경우
                    parentNode!.right = node.right
                }
                return true
            }
            /// 왼쪽 자식이 있을 때
            if node.left != nil && node.right == nil {
                /// 부모의  왼쪽 자식일 경우
                if parentNode!.data > node.data {
                    parentNode!.left = node.left
                }
                else {
                    /// 부모의  오른쪽 자식일 경우
                    parentNode!.right = node.left
                }
                return true
            }
            
            // 1-3. 자식이 두 개일 경우 (자식 중 오른쪽 자식트리의 노드 중 선택해서 현재 자리에 배정하는 방법)
            if node.left != nil && node.right != nil {
                /// 오른쪽 자식 트리 중 가장 왼쪽에 있는 노드를 현재 자리(지울 노드가 부모의 왼쪽자식이면 부모의 왼쪽자식으로, 아니면 오른쪽 자식으로)에 올리는데,
                var upsideNode: Node? = node.right
                var upsideNodeParent: Node? = node.right
                
                while let leftNode = upsideNode!.left {
                    upsideNodeParent = upsideNode
                    upsideNode = leftNode
                }
                
                /// 만약 자식이 있으면 (오른쪽 자식노드) 그 노드를 올리는 노드의 부모노드의 왼쪽 자식노드로 만든다.
                if let upsideNodeRight = upsideNode!.right {
                    upsideNodeParent!.left = upsideNodeRight
                }
                
                /// 지울 노드가 부모의 왼쪽자식인 경우 왼쪽 자식으로 올림
                if parentNode!.left!.data == node.data {
                    parentNode!.left = upsideNode
                    
                }
                else { /// 지울 노드가 부모의 오른쪽자식인 경우
                    parentNode!.right = upsideNode
                }
                
                // 연결이 끊긴 노드를 다시 연결
                upsideNode!.left = node.left
                upsideNode!.right = node.right
            }
        } else {
            // 2. 탐색 실패한 경우(currentNode가 nil일 경우)
            return false
        }
        return true
    }
    
    // search
    public func search(_ data: T) -> Bool {
        if root == nil {
            return false
        }
        var currentNode = root
        while let node = currentNode {
            if node.data == data {
                return true
            }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }
    
    
    // 트리 다이어그램 drawer
    public func drawDiagram() {
        print(diagram(for: self.root))
    }
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.data)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

// 최대 힙
public class MaxHeap<T: Comparable> {
    public var heap: Array<T> = []
    
    public init(_ data: T) {
        heap.append(data)
        heap.append(data)
    }
    
    
    public func insert(_ data: T) -> Bool {
        if heap.isEmpty {
            // 1번째 인덱스부터 시작
            heap.append(data)
            heap.append(data)
            return true
        }
        heap.append(data)
        var parentNode = heap[(heap.count-1)/2]

        while true {
            if parentNode < data {
                heap.swapAt(heap.count-1, (heap.count-1)/2)
            }
            if (heap.count-1)/4 >= 1 {
                parentNode = heap[(heap.count-1)/4]
            }
            else {
                return true
            }
        }
        return true
    }
}

// 최소힙(우선순위큐)
public class MinHeap<T: Comparable> {
    public var heap: Array<T> = []
    
    public init(_ data: T) {
        heap.append(data)
        heap.append(data)
    }
    
    public init() { }
    
    @discardableResult
    public func insert(_ data: T) -> Bool {
        if heap.isEmpty {
            // 1번째 인덱스부터 시작
            heap.append(data)
            heap.append(data)
            return true
        }
        heap.append(data)
        
        var parentNodeIndex = (heap.count-1)/2
        var presentNodeIndex = (heap.count-1)
        
        compareNSwap(presentNodeIndex: presentNodeIndex)
        
        func compareNSwap(presentNodeIndex: Int) {
            parentNodeIndex = presentNodeIndex/2
            
            if heap[parentNodeIndex] > heap[presentNodeIndex] {
                heap.swapAt(presentNodeIndex, presentNodeIndex/2)
                if parentNodeIndex/2 >= 1 {
                    compareNSwap(presentNodeIndex: parentNodeIndex)
                }
            }
        }
        return true
    }
    
    public func pop() -> T? {
        
        if heap.count <= 1 {
            print("heap is empty")
            return nil
        }
        
        var node = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
    
        compareNSwap(parent: 1)
        func compareNSwap(parent: Int) {
            
            var parentIndex = parent
            var leftNode = parentIndex * 2
            var rightNode = parentIndex * 2 + 1
            
            // 자식 노드가 없는 경우
            if heap.count <= leftNode {
                // 바꾸지 않음
            }
            // 왼쪽 자식노드만 있는 경우
            else if heap.count <= rightNode {
                // 왼쪽 노드만 비교
                if heap[leftNode] < heap[parent] {
                    heap.swapAt(leftNode, parent)
                    compareNSwap(parent: leftNode)
                }
            }
            // 둘 다 있는 경우
            else {
                // 왼쪽 자식 노드가 부모보다 작을 때
                if heap[leftNode] < heap[parent] {
                    // 오른쪽 자식 노드가 왼쪽 자식노드보다 작을 때
                    if heap[rightNode] < heap[leftNode] {
                        heap.swapAt(parent, rightNode)
                        compareNSwap(parent: rightNode)
                    }
                    else {
                        heap.swapAt(parent, leftNode)
                        compareNSwap(parent: leftNode)
                    }
                }
                else {
                    if heap[rightNode] < heap[parent] {
                        heap.swapAt(parent, rightNode)
                        compareNSwap(parent: rightNode)
                    }
                }
            }
            
        }
        return node
    }
}



