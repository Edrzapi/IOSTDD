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

    func testDeleteTaskButton_RemovesTaskFromList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.buttons["Add Task"]
        XCTAssertTrue(addButton.exists, "The 'Add Task' button should exist on launch.")
        addButton.tap()
        
        let newTask = app.staticTexts["New Task"]
        XCTAssertTrue(newTask.waitForExistence(timeout: 1), "The new task should appear in the list after tapping 'Add Task'.")
        
        let deleteButton = app.buttons.matching(identifier: "Delete Task").firstMatch
        XCTAssertTrue(deleteButton.exists)
        deleteButton.tap()

        XCTAssertFalse(newTask.exists, "After tapping 'Delete Task', the task should be removed from the list.")
    }
}
