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
//        array()
        linkdedListTest()
    }
    
    func array() {
        let datas = HBArray(size: 4)
        //        datas.push(10)
        datas.insert(item: 10, at: 1)
        print("------ ARRAY BE:: \(datas.getArray())")
        datas.delete(index: 1)
        
        //        datas.remove(item: 10)
        print("------ ARRAY AF:: \(datas.getArray())")
        print("------ SIZE :: \(datas.size)")
        print("------ CAPACITY :: \(datas.capacity)")
    }
    
    func linkdedListTest() {
        var linkdedList = HBLinkdedList<Int>()
        linkdedList.push_front(item: 1)
        linkdedList.push_back(item: 2)
        linkdedList.push_back(item: 3)
        linkdedList.push_back(item: 4)
        linkdedList.insert(index: 4, item: 10)
        
        print("------ VALUE :: \(linkdedList.value_at(index: 1))")
        print("------ HEAD :: \(linkdedList.head?.value)")
        print("------ TAIL :: \(linkdedList.tail?.value)")
    }
}

