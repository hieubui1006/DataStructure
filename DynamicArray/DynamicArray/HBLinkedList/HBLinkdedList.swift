//
//  HBLinkdedList.swift
//  DynamicArray
//
//  Created by mrhb on 25/11/2023.
//

import UIKit

class Node<T> {
    
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct HBLinkdedList<T> {
    
    var head: Node<T>? {
        didSet {
            if tail == nil {
                self.tail = head
            } else {
                self.tail = head?.next
            }
            self.tail?.next = nil
        }
    }
    var tail: Node<T>?
    
    init() { }
    
}

extension HBLinkdedList {
    
    func size() -> Int {
        var size = 0
        var p = head
        while p?.next != nil {
            p = p?.next
            size += 1
        }
        return size + 1
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func value_at(index: Int) -> T? {
        var idx = 0
        var p = head
        while idx != index {
            p = p?.next
            idx += 1
        }
        
        return p?.value
    }
    
    mutating func push_front(item: T) {
        let node = Node(value: item, next: head)
        head = node
    }
    
    mutating func pop_front() -> T? {
        head = head?.next
        return head?.value
    }
    
    mutating func push_back(item: T) {
        let node = Node(value: item)
        
        if tail == nil {
            tail = node
            head = tail
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func pop_back() -> T? {
        var p = head
        while p?.next?.next != nil {
            p = p?.next
        }
        tail = p
        tail?.next = nil
        return tail?.value
    }
    
    func front() -> T? {
        return head?.value
    }
    
    func  back() -> T? {
        /// giá trị O(n)
        var p = head
        while p?.next?.next != nil {
            p = p?.next
        }
        return p?.value
        
        /// giá trị O(1)
        return tail?.value
    }
    
    mutating func insert(index: Int, item: T) {
        guard index <= size() else { return }
        if index == 0 {
            push_front(item: item)
            return
        }
        if index == size() {
            push_back(item: item)
            return
        }
        
        var idx = 1
        var p = head
        while p?.next != nil {
            if idx == index {
                let node = Node(value: item, next: p?.next)
                p?.next = node
                break
            }
            p = p?.next
            idx += 1
        }
    }
    
    mutating func erase(index: Int) {
        guard index < size() else { return }
        if index == 0 {
            _ = pop_front()
            return
        }
        if index == size() - 1 {
            _ = pop_back()
            return
        }
        
        var idx = 1
        var p = head
        while p?.next != nil {
            if idx == index {
                guard let value = p?.next?.value else { return }
                let node = Node(value: value, next: p?.next)
                p?.next = node.next?.next
                break
            }
            p = p?.next
            idx += 1
        }
        print("========== \(p.debugDescription)")
    }
    
}
