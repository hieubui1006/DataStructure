import UIKit


class ArrayManager {
    
    fileprivate var size = 0
    fileprivate var fromVC: UIViewController!
    fileprivate var array = [Int]()
    
    init(size: Int, fromVC: UIViewController) {
        self.size = size
        self.array = [Int](repeating: 0, count: size)
        self.fromVC = fromVC
    }
}

extension ArrayManager {
    
    var capacity: Int {
        return size
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
    func append(_ item: Int) {
        size += 1
        array[size - 1] = item
    }
    
    /* - Thêm 1 phần tử ở 1 vị trí thoả mãn trong mảng
       - insert(index, item) - inserts item at index, shifts that index's value and trailing elements to the right
     */
    func insert(item: Int, at index: Int) {
        guard index < size else { return }
        resize()
        for i in index...size {
            if i == index {
                array[i] = item
            } else {
                array[i] = array[i - 1]
            }
        }
    }
    
    /// - remove from end, return value
    func pop() {
        size -= 1
    }
    
    /// - delete item at index, shifting all trailing elements left
    func delete(index: Int) {
        for i in index..<size - 1 {
            array[i] = array[i + 1]
        }
        var arrTemp = [Int](repeating: 0, count: size - 1)
        for idx in 0..<size - 1 {
            arrTemp[idx] = array[idx]
        }
        array = arrTemp
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
    func resize() {
        if size == capacity {
            let newSize = 2 << size - 1
            var arrNew = [Int](repeating: 0, count: newSize)
            for i in 0..<size {
                arrNew[i] = array[i]
            }
            array = arrNew
            size = newSize
        }
    }
}
