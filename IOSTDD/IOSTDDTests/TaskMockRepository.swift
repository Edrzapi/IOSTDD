import XCTest
@testable import IOSTDD

// MARK: — Manual mock for RepositoryProtocol
actor TaskRepositoryMock: RepositoryProtocol {
    private(set) var addTaskCalled = false
    private(set) var addedTask: TodoItem?
    
    private(set) var removeTaskCalled = false
    private(set) var removedID: UUID?
    
    func fetchTasks() async -> [TodoItem] {
        return []
    }
    
    func addTask(_ task: TodoItem) async {
        addTaskCalled = true
        addedTask = task
    }
    
    func removeTask(by id: UUID) async {
        removeTaskCalled = true
        removedID = id
    }
}
