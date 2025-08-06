// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

actor RepositoryProtocolMock: RepositoryProtocol {

    // MARK: - Call Tracking

    var fetchTasks()Called = false
    var addTask(_ task: TodoItem)Called = false
    var addTask(_ task: TodoItem)_task: TodoItem?
    var removeTask(by id: UUID)Called = false
    var removeTask(by id: UUID)_id: UUID?

    // MARK: - Protocol Conformance

    func fetchTasks()() [TodoItem] {
        fetchTasks()Called = true
        // TODO: Return a stubbed value here
        fatalError("Mock for fetchTasks() must return a value")
    }
    func addTask(_ task: TodoItem)(task: TodoItem) Void {
        addTask(_ task: TodoItem)Called = true
        self.addTask(_ task: TodoItem)_task = task
        // TODO: Return a stubbed value here
        fatalError("Mock for addTask(_ task: TodoItem) must return a value")
    }
    func removeTask(by id: UUID)(id: UUID) Void {
        removeTask(by id: UUID)Called = true
        self.removeTask(by id: UUID)_id = id
        // TODO: Return a stubbed value here
        fatalError("Mock for removeTask(by id: UUID) must return a value")
    }
}
