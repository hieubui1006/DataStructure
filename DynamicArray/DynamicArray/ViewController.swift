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
        let datas = ArrayManager(list: [1,2,3,4,5], fromVC: self)
        datas.append(6)
        datas.delete(index: 2)
        datas.insert(item: 10, at: 2)
        print("------ ARRAY :: \(datas.getArray())")
        print("------ SIZE :: \(datas.size)")
        print("------ CAPACITY :: \(datas.capacity)")
    }
}

