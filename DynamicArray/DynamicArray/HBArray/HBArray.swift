import UIKit


class HBArray {
    
     var size = 0
     var capacity = 2
    fileprivate var array = [Int]()
    
    init(size: Int) {
        self.size = size
        array = [Int](repeating: .init(), count: size)
        resizeUp()
    }
}

extension HBArray {
    
    func getArray() -> [Int] {
        return array
    }
    
    /// mảng rỗng
    var isEmpty: Bool {
        return size == 0
    }
    
    /// trả về 1 phần tử ở 1 vị trí bất kỳ trong mảng
    func at(index: Int) -> Int? {
        guard index < size else { return nil }
        return array[index]
    }
    
    /// thêm 1 phần tử vào cuối mảng
    func push(_ item: Int) {
        resizeUp()
        array[size] = item
        size += 1
    }
    
    /* - Thêm 1 phần tử ở 1 vị trí thoả mãn trong mảng
       - insert(index, item) - inserts item at index, shifts that index's value and trailing elements to the right
     */
    func insert(item: Int, at index: Int) {
        guard index < size else { return }
        resizeUp()
        var arrTemp = array
        for i in index...size {
            if i == index {
                arrTemp[i] = item
            } else {
                arrTemp[i] = array[i - 1]
            }
        }
        array = arrTemp
        size += 1
    }
    
    /// - remove from end, return value
    func pop() {
        size -= 1
        resizeDown()
    }
    
    /// - delete item at index, shifting all trailing elements left
    func delete(index: Int) {
        for i in index..<size - 1 {
            array[i] = array[i + 1]
        }
        size -= 1
        resizeDown()
    }
    
    func remove(item: Int) {
        var sizeTemp = 0
        for i in 0..<size {
            if item == array[i] {
                sizeTemp += 1
                array[i] = array[i + 1]
            }
        }
        size -= sizeTemp
        resizeDown()
    }
    
    /// -  find(item) - looks for value and returns first index with that value, -1 if not found
    func find(item: Int) -> Int {
        for i in 0..<size {
            if array[i] == item {
                return i
            }
        }
        return -1
    }
    
    /// tăng dung lượng bộ nhớ cho mảng
    /* - can allocate int array under the hood, just not use its features
     - start with 16, or if starting number is greater, use power of 2 - 16, 32, 64, 128
     */
    func resizeUp() {
        while (capacity <= size) {
            capacity = 2 * capacity
        }
        resizeArray()
    }
    
    func resizeDown() {
        while (capacity > size * 2) {
            capacity = capacity * 2 / 4
        }
        resizeArray()
    }
    
    private
    func resizeArray() {
        var arrNew = [Int](repeating: .init(), count: self.capacity)
        for i in 0..<size {
            arrNew[i] = array[i]
        }
        array = arrNew
    }
}
