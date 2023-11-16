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
        let datas = HBArray(size: 3)
        datas.push(10)
        datas.insert(item: 10, at: 2)
        datas.delete(index: 1)
        print("------ ARRAY BE:: \(datas.getArray())")
        datas.remove(item: 10)
        print("------ ARRAY AF:: \(datas.getArray())")
        print("------ SIZE :: \(datas.size)")
        print("------ CAPACITY :: \(datas.capacity)")
    }
}

