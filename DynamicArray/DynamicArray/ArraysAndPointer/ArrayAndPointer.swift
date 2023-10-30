import UIKit

/// Practice coding using arrays and pointers, and pointer math to jump to an index instead of using indexing.
class ArrayAndPointer {
    static func run() {
        var arr = [1,2,3,4]
        let arrNew = arr
        arr[0] = 5
        
        print(arr)
        print(arrNew)
    }
}
