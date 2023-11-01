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
        var datas = ArrayManager(list: [1,2,3,4], fromVC: self)
        datas.insert(item: 5, at: 2)
        print(datas.getArray())
    }
}

