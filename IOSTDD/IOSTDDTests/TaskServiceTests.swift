
final class TaskServiceTests: XCTestCase {
    
    // MARK: — Creating tasks
    func testCreateTask_CallsRepositoryAddTask() async {
        let mockRepo = MockRepository()
        let service = TaskService(repository: mockRepo)
        
        await service.createTask(title: "Foo")
        
        XCTAssertTrue(mockRepo.addTaskCalled,
                      "createTask(title:) should call repository.addTask(_:)")
        XCTAssertEqual(mockRepo.addedTask?.title, "Foo",
                       "createTask(title:) should pass a TodoItem with the correct title")
    }

    // MARK: — Deleting tasks
    func testDeleteTask_CallsRepositoryRemoveTask() async {
        let mockRepo = MockRepository()
        let service = TaskService(repository: mockRepo)
        let id = UUID()
        
        await service.deleteTask(id: id)
        
        XCTAssertTrue(mockRepo.removeTaskCalled,
                      "deleteTask(id:) should call repository.removeTask(by:)")
        XCTAssertEqual(mockRepo.removedID, id,
                       "deleteTask(id:) should pass the correct UUID to the repository")
    }
}
