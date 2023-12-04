//
//  HBArrayTest.swift
//  DynamicArray
//
//  Created by mrhb on 19/11/2023.
//

import XCTest
@testable import DynamicArray


final class HBArrayTests: XCTestCase {
    var array = HBArray(size: 0)
    
    override func setUp() {
        array.push(1)
        array.push(2)
        array.push(3)
        array.push(4)
    }
    
    func testGetItemAtIndex() {
        let item = array.at(index: 2)
        XCTAssertEqual(item, 2)
    }
    
    func testValidNonEmpty() {
        let item = array.isEmpty
        
        XCTAssertEqual(item, false)
    }
    
    func testPushItem() {
        array.push(10)
        
        XCTAssertTrue(array.size == 5)
    }
    
    func testInsertItemWithIndex() {
        array.insert(item: 9, at: 3)
        let itemIndex = array.at(index: 3)
        
        XCTAssertEqual(itemIndex, 9)
        XCTAssertTrue(array.size == 5)
        print("============\(array.getArray())")
    }
    
    func testRemoveLastIndex() {
        array.pop()
        let itemIndex = array.find(item: 4)
        
        XCTAssertEqual(itemIndex, -1)
        XCTAssertTrue(array.size == 3)
    }
    
    func testFindItemReturnIndex() {
        let index = array.find(item: 2)
        
        XCTAssertEqual(index, 1)
    }
    
    func testDeleteWithIndex() {
        array.delete(index: 2)
        let itemIndex = array.find(item: 3)
        
        XCTAssertEqual(itemIndex, -1)
        XCTAssertTrue(array.size == 3)
    }
    
    func testRemoveItem() {
        array.remove(item: 3)
        let itemIndex = array.find(item: 3)
        
        XCTAssertEqual(itemIndex, -1)
        XCTAssertTrue(array.size == 3)
    }
    
    func testResizeUpCapacity() {
        array = HBArray(size: 0)
        for i in 0...20 {
            array.push(i)
        }
        
        XCTAssertTrue(array.capacity == 32)
    }
    
    func testResizeDownTo4Capacity() {
        array = HBArray(size: 0)
        for i in 0...30 {
            array.push(i)
        }
        
        for i in 0...16 {
            array.remove(item: i)
        }
        
        XCTAssertTrue(array.capacity == 16)
    }
    
    
}

