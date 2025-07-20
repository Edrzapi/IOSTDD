import XCTest
@testable import IOSTDD

final class TaskListViewModelTests: XCTestCase {
    
    
    @MainActor func testTasks_AreEmptyOnInit() {
        let vm = TaskListViewModel()
        XCTAssertTrue(vm.tasks.isEmpty, "TaskListViewModel should start with an empty task list.")
    }
    
    
    @MainActor func testAddTask_IncreasesTaskCount() {
        let vm = TaskListViewModel()
        
        vm.addTask(title: "Test Task")
        
        XCTAssertEqual(vm.tasks.count, 1, "Adding a task should increase the task count.")
        XCTAssertEqual(vm.tasks.first?.title, "Test Task", "The added task should have the correct title.")
    }
    
    
    @MainActor   func testRemoveTask_DecreasesTaskCount() {
        let vm = TaskListViewModel()
        vm.addTask(title: "Task to Remove")
        let task = vm.tasks.first!
        
        vm.removeTask(id: task.id)
        
        XCTAssertTrue(vm.tasks.isEmpty, "Removing a task should result in an empty task list.")
    }
}
