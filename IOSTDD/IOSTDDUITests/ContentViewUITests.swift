import XCTest

final class ContentViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testAddTaskButton_AddsTaskToList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.buttons["Add Task"]
        XCTAssertTrue(addButton.exists, "The 'Add Task' button should exist on launch.")
        addButton.tap()
        
        let newTask = app.staticTexts["New Task"]
        XCTAssertTrue(newTask.waitForExistence(timeout: 1), "Tapping 'Add Task' should display a new task in the list.")
    }
    
}
	
