import UIKit


class ArrayManager {
    
    fileprivate var array = [Any]()
    fileprivate var fromVC: UIViewController!
    
    init(list: [Any], fromVC: UIViewController) {
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
        return array.count
    }
    
    /// max dung lượng của mảng
    var capacity: Int {
        return array.capacity
    }
    
    /// mảng rỗng
    var isEmpty: Bool {
        return array.count == 0
    }
    
    /// trả về 1 phần tử ở 1 vị trí bất kỳ trong mảng
    func at(index: Int) -> Any? {
        guard index < array.count else { return nil }
        return array[index]
    }
    
    /// thêm 1 phần tử vào cuối mảng
    func append(_ item: Any) {
        return array.append(item)
    }
    
    /* - Thêm 1 phần tử ở 1 vị trí thoả mãn trong mảng
       - insert(index, item) - inserts item at index, shifts that index's value and trailing elements to the right
     */
    func insert(item: Any, at index: Int) {
        upsizeArray(array)
        guard index < array.count else {
            fromVC.present(UIAlertController(title: "Thông báo", message: "Không thể chèn phần tử vào vị trí số \(index)", preferredStyle: .alert), animated: true)
            return
        }
        if index == array.count - 1 {
            array.append(item)
        } else {
            array.append(item)
            var arrTemp = [Any]()
            
            for i in 0..<array.count {
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
        var arrTemp = [Any]()
        
        for i in 0..<array.count {
            if i != index {
                arrTemp.append(array[i])
            }
        }
        array = arrTemp
    }
    
    /// tăng dung lượng bộ nhớ cho mảng
    func upsizeArray(_ arr: [Any]) {
        if arr.count == array.capacity {
            var arrNew = [Any](repeating: 0, count: array.capacity * 2)
            
            for i in 0..<array.count {
                arrNew[i] = array[i]
            }
            array = arrNew
        }
    }
}
