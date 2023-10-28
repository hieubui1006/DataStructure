//
//  ViewController.swift
//  DynamicArray
//
//  Created by mrhb on 28/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicArray()
    }
    
    func dynamicArray() {
        var values: [Int] = [0, 1, 2, 3]

        if values.count == values.capacity {
            var arrNew = [Int](repeating: 0, count: values.capacity * 2)
            
            for i in 0..<values.count {
                arrNew[i] = values[i]
            }
            
            values = arrNew
            
            print(arrNew.capacity)
            print(values.capacity)
        }
    }
}

