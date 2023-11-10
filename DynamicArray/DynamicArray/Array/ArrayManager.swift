import UIKit


class ArrayManager {
    
    fileprivate var array = [Int]()
    fileprivate var fromVC: UIViewController!
    
    init(list: [Int], fromVC: UIViewController) {
        self.array = list
        self.fromVC = fromVC
    }
    
    func getArray() -> [Int] {
        return array
    }
}

extension ArrayManager {
    
    /// phần tử trong mảng
    var size: Int {
        var idx = 0
        for _ in array {
            idx += 1
        }
        return idx
    }
    
    var capacity: Int {
        var value = 1
        for _ in array {
            guard value < size else { return value }
            value = value * 2
        }
        return value
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
        var arrTemp = [Int](repeating: 0, count: size + 1)
        for i in 0...size {
            if i == size {
                arrTemp[i] = item
            } else {
                arrTemp[i] = array[i]
            }
        }
        array = arrTemp
    }
    
    /* - Thêm 1 phần tử ở 1 vị trí thoả mãn trong mảng
       - insert(index, item) - inserts item at index, shifts that index's value and trailing elements to the right
     */
    func insert(item: Int, at index: Int) {
        guard index < size else { return }
        var arrTemp = [Int](repeating: 0, count: size + 1)
        for i in 0...size {
            if i < index {
                arrTemp[i] = array[i]
            } else {
                if i == index {
                    arrTemp[i] = item
                } else {
                    arrTemp[i] = array[i - 1]
                }
            }
        }
        array = arrTemp
    }
    
    /// - remove from end, return value
    func pop() {
        var arrTemp = [Int]()
        
        for i in 0..<size {
            if i != size - 1 {
                arrTemp.append(array[i])
            }
        }
        array = arrTemp
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
        var arrNew = [Int](repeating: 0, count: capacity)
        for i in 0..<size {
            arrNew[i] = array[i]
        }
        array = arrNew
    }
}
