import UIKit


class DynamicArray {
    
    static func upsizeArray() {
        var values: [Int] = [0, 1, 2, 3]

        if values.count == values.capacity {
            var arrNew = [Int](repeating: 0, count: values.capacity * 2)
            
            for i in 0..<values.count {
                arrNew[i] = values[i]
            }
            
            values = arrNew
            
            values.removeLast()
            
            print(arrNew.count)
            print(values.count)
        }
    }
}
