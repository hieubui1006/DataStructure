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
    var prev: Node<T>?
    
    init(value: T, next: Node<T>? = nil, prev: Node<T>? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

// ========== Doubly Linked List ===========
struct HBDoublyLinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    var size = 0
    
    init() {
        head = nil
        tail = head
    }
    
    mutating func push_back(item: T) {
        let node = Node(value: item)
        
        if tail == nil {
            tail = node
            head = tail
            node.prev = nil
        } else {
            tail?.next = node
            node.prev = tail
            tail = node
        }
        size += 1
    }
    
    func value_n_from_end(index: Int) -> T? {
        guard index < size else { return nil }
        
        var idx = size - 1
        var p = tail
        while idx != index {
            p = p?.prev
            idx -= 1
        }
        return p?.value
    }
    
    mutating func reverse() {
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
          let next = current?.next
          current?.next = prev
          prev = current
          current = next
        }
        
        head = prev
        
    }
}


// ========== Singly Linked List ===========
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
    var size: Int = 0

    init() { }
    
}

extension HBLinkdedList {
    
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
        size += 1
    }
    
    mutating func pop_front() -> T? {
        head = head?.next
        size -= 1
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
        size += 1
    }
    
    mutating func pop_back() -> T? {
        var p = head
        while p?.next?.next != nil {
            p = p?.next
        }
        tail = p
        tail?.next = nil
        size -= 1
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
        guard index <= size else { return }
        if index == 0 {
            push_front(item: item)
            return
        }
        if index == size {
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
        size += 1
    }
    
    mutating func erase(index: Int) {
        guard index < size else { return }
        if index == 0 {
            _ = pop_front()
            return
        }
        if index == size - 1 {
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
        size -= 1
        print("========== \(p.debugDescription)")
    }
}
