import XCTest
@testable import IOSTDD


// MARK: — Manual mock for RepositoryProtocol
actor TaskRepositoryMock: RepositoryProtocol {
    // For addTask
    private(set) var addTaskCalled = false
    private(set) var addedTask: TodoItem?

    // For removeTask
    private(set) var removeTaskCalled = false
    private(set) var removedID: UUID?

    // For fetchTasks
    private(set) var fetchTasksCalled = false
    private var stubbedTasks: [TodoItem] = []

    func setStubbedTasks(_ tasks: [TodoItem]) async {
        stubbedTasks = tasks
    }

    func fetchTasks() async -> [TodoItem] {
        fetchTasksCalled = true
        return stubbedTasks
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
