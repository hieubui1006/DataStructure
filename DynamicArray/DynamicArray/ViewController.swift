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
        print("------ SIZE :: \(datas.append(6))")
        print("------ SIZE :: \(datas.size)")
        print("------ CAPACITY :: \(datas.capacity)")
    }
}

