import XCTest
@testable import IOSTDD

final class TaskServiceTests: XCTestCase {
    
    // MARK: — Creating tasks
    func testCreateTask_CallsRepositoryAddTask() async {
        let mockRepo = TaskRepositoryMock()
        let service = TaskService(repository: mockRepo)
        
        await service.createTask(title: "Foo")
        
        let addCalled  = await mockRepo.addTaskCalled
        let addedTitle = await mockRepo.addedTask?.title
        
        XCTAssertTrue(addCalled,
                      "createTask(title:) should call repository.addTask(_:)")
        XCTAssertEqual(addedTitle, "Foo",
                       "createTask(title:) should pass a TodoItem with the correct title")
    }
    
    // MARK: — Deleting tasks
    func testDeleteTask_CallsRepositoryRemoveTask() async {
        let mockRepo = TaskRepositoryMock()
        let service = TaskService(repository: mockRepo)
        let id = UUID()
        
        await service.deleteTask(id: id)
        
        let removeCalled = await mockRepo.removeTaskCalled
        let removedID    = await mockRepo.removedID
        
        XCTAssertTrue(removeCalled,
                      "deleteTask(id:) should call repository.removeTask(by:)")
        XCTAssertEqual(removedID, id,
                       "deleteTask(id:) should pass the correct UUID to the repository")
    }
    
    // MARK: — Fetching tasks
    func testFetchTasks_CallsRepositoryFetchTasks() async {
        let mockRepo = TaskRepositoryMock()
        let service = TaskService(repository: mockRepo)
        
        let stubTasks = [TodoItem(title: "Task A"), TodoItem(title: "Task B")]
        await mockRepo.setStubbedTasks(stubTasks)
        
        let fetched = await service.fetchTasks()
        
        XCTAssertEqual(fetched.map(\.title), stubTasks.map(\.title),
                       "fetchTasks() should return the list provided by the repository")
        
        let wasFetchCalled = await mockRepo.fetchTasksCalled
        XCTAssertTrue(wasFetchCalled, "fetchTasks() should call repository.fetchTasks()")
    }
}

