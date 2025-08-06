import XCTest
@testable import IOSTDD

final class TaskServiceTests: XCTestCase {
    
    // MARK: — Creating tasks
    func testCreateTask_CallsRepositoryAddTask() async {
        // Arrange: create the mock (an actor that records calls)
        let mockRepo = TaskRepositoryMock()
        let service = TaskService(repository: mockRepo)

        // Act: call the service method under test
        await service.createTask(title: "Foo")
        // At this point, inside mockRepo.addTask(_:):
        //   addTaskCalled is set to true
        //   addedTask is set to the TodoItem(title: "Foo")

        // Assert: read the actor‐isolated flags out of the mock
        let addCalled  = await mockRepo.addTaskCalled   // should be true
        let addedTitle = await mockRepo.addedTask?.title // should be "Foo"

        // Verify that the mock recorded the interaction
        XCTAssertTrue(addCalled,
                      "createTask(title:) should call repository.addTask(_:)")
        XCTAssertEqual(addedTitle, "Foo",
                       "createTask(title:) should pass a TodoItem with the correct title")
    }

    
    // MARK: — Deleting tasks
    func testDeleteTask_CallsRepositoryRemoveTask() async {
        // Arrange: same mock, new service
        let mockRepo = TaskRepositoryMock()
        let service = TaskService(repository: mockRepo)
        let id = UUID()
        
        // Act: call the service delete method
        await service.deleteTask(id: id)
        // Inside mockRepo.removeTask(by:):
        //   removeTaskCalled = true
        //   removedID = id

        // Assert: read back the recorded values
        let removeCalled = await mockRepo.removeTaskCalled // should be true
        let removedID    = await mockRepo.removedID        // should equal id
        
        // Verify that deleteTask forwarded the call correctly
        XCTAssertTrue(removeCalled,
                      "deleteTask(id:) should call repository.removeTask(by:)")
        XCTAssertEqual(removedID, id,
                       "deleteTask(id:) should pass the correct UUID to the repository")
    }
}
