import UIKit


class ArrayManager {
    
    fileprivate var array = [Int]()
    fileprivate var fromVC: UIViewController!
    
    init(list: [Int], fromVC: UIViewController) {
        self.array = list
        self.fromVC = fromVC
    }
    
    func getArray() -> [Any] {
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
        return array.append(item)
    }
    
    /* - Thêm 1 phần tử ở 1 vị trí thoả mãn trong mảng
       - insert(index, item) - inserts item at index, shifts that index's value and trailing elements to the right
     */
    func insert(item: Int, at index: Int) {
        resize()
        if index == size - 1 {
            array.append(item)
        } else {
            array.append(item)
            var arrTemp = [Int]()
            
            for i in 0..<size {
                if i < index {
                    arrTemp.append(array[i])
                } else {
                    if i == index {
                        arrTemp.append(item)
                    } else {
                        arrTemp.append(array[i - 1])
                    }
                }
            }
            array = arrTemp
        }
    }
    
    /// - remove from end, return value
    func pop() {
        array.remove(at: array.count - 1)
    }
    
    /// - delete item at index, shifting all trailing elements left
    func delete(index: Int) {
        guard index < array.count else {
            fromVC.present(UIAlertController(title: "Thông báo", message: "Không thể xoá vị trí số \(index)", preferredStyle: .alert), animated: true)
            return
        }
        var arrTemp = [Int]()
        
        for i in 0..<array.count {
            if i != index {
                arrTemp.append(array[i])
            }
        }
        array = arrTemp
    }
    
    /// -  find(item) - looks for value and returns first index with that value, -1 if not found
    func find(item: Int) -> Int {
        for i in 0..<array.count {
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
