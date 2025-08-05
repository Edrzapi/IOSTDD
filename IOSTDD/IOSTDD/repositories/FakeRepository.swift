
import Foundation

actor FakeRepository: RepositoryProtocol {
    private(set) var storedTasks: [TodoItem]
    init(seedTasks: [TodoItem] = [
        TodoItem(title: "Stub Task 1"),
        TodoItem(title: "Stub Task 2")
    ]) {
        self.storedTasks = seedTasks
    }
    func fetchTasks() async -> [TodoItem] { storedTasks }
    func addTask(_ task: TodoItem) async { storedTasks.append(task) }
    func removeTask(by id: UUID) async { storedTasks.removeAll { $0.id == id } }
}


