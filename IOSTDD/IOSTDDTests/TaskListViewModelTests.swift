
import XCTest
@testable import IOSTDD

final class TaskListViewModelTests: XCTestCase {
    /// RED: Verify that a fresh view‑model starts with no tasks.
    func testTasks_AreEmptyOnInit() {
        // Arrange & Act
        let vm = TaskListViewModel()
        
        // Assert
        XCTAssertTrue(vm.tasks.isEmpty,
                      "A new TaskListViewModel should start with an empty tasks array")
    }
}




