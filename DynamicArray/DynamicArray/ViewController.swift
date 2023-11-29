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
//        linkdedListTest()
        doublyLinkedList()
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
//        linkdedList.insert(index: 2, item: 8)
//        linkdedList.erase(index: 3)
        
        print("------ VALUE :: \(linkdedList.value_at(index: 3))")
        print("------ HEAD :: \(linkdedList.head?.value)")
        print("------ TAIL :: \(linkdedList.tail?.value)")
    }
    
    func doublyLinkedList() {
        var list = HBDoublyLinkedList<Int>()
        list.push_back(item: 1)
        list.push_back(item: 2)
        list.push_back(item: 3)
        list.push_back(item: 4)
        list.reverse()
        print(" ======VALUE :: \(list.value_n_from_end(index: 2))")
    }
}

