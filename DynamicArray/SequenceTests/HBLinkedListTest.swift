import XCTest
@testable import DynamicArray

final class HBLinkedListTest : XCTestCase {
    var linkedList = HBLinkdedList<Int>()
    
    override func setUp() {
        linkedList.push_back(item: 1)
        linkedList.push_back(item: 2)
        linkedList.push_back(item: 3)
        linkedList.push_back(item: 4)
        linkedList.push_back(item: 5)
    }
    
    func testIsEmpty() {
        XCTAssertFalse(linkedList.isEmpty())
    }
    
    func testGetValueFromIndex() {
        let item = linkedList.value_at(index: 2)
        XCTAssertEqual(item, 3)
    }
    
    func testPushFrontItem() {
        linkedList.push_front(item: 10)
        
        let item = linkedList.value_at(index: 0)
        XCTAssertEqual(item, 10)
    }
    
    func testPopFrontItem() {
        _ = linkedList.pop_front()
        
        let item = linkedList.value_at(index: 0)
        XCTAssertNotEqual(item, 10)
    }
    
    func testPushBackItem() {
        linkedList.push_back(item: 6)
        
        let item = linkedList.value_at(index: linkedList.size - 1)
        XCTAssertEqual(item, 6)
    }
    
    func testPopBackItem() {
        _ = linkedList.pop_back()
        
        let item = linkedList.value_at(index: linkedList.size - 1)
        XCTAssertNotEqual(item, 5)
    }
    
    func testReturnFirstItem() {
        let item = linkedList.front()
        XCTAssertEqual(item, 1)
    }
    
    func testReturnLastItem() {
        let item = linkedList.back()
        XCTAssertEqual(item, 5)
    }
    
    func testInsertItemWithIndex() {
        linkedList.insert(index: 1, item: 10)
        
        let item = linkedList.value_at(index: 1)
        XCTAssertEqual(item, 10)
    }
    
    func testRemoveItemWithIndex() {
        linkedList.erase(index: 3)
        
        let item = linkedList.value_at(index: 3)
        XCTAssertNotEqual(item, 4)
    }
    
    func testRemoveValue() {
        linkedList.remove_value(item: 3)
        
        let item = linkedList.value_at(index: 2)
        XCTAssertNotEqual(item, 3)
    }
    
    func testReverseList() {
        linkedList.reverse()
        
        let firstItem = linkedList.value_at(index: 0)
        let lastItem = linkedList.value_at(index: linkedList.size - 1)
        XCTAssertEqual(firstItem, 5)
        XCTAssertEqual(lastItem, 1)
    }
}
