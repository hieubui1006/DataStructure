import UIKit

///when you reach capacity, resize to double the size
///O(1) to add/remove at end (amortized for allocations for more space), index, or update
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
