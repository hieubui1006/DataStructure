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
        let datas = HBArray(size: 5)
        datas.push(6)
        datas.delete(index: 2)
        datas.insert(item: 10, at: 3)
        print("------ ARRAY :: \(datas.getArray())")
        print("------ SIZE :: \(datas.size)")
        print("------ CAPACITY :: \(datas.capacity)")
    }
}

