import Foundation

final class FakeRepository: RepositoryProtocol {
    private var storedTasks: [Task] = [
        Task(title: "Stub Task 1"),
        Task(title: "Stub Task 2")
    ]
    
    func fetchTasks() -> [Task] {
        return storedTasks
    }
    
    func addTask(_ task: Task) {
        storedTasks.append(task)
    }
    
    func removeTask(by id: UUID) {
        storedTasks.removeAll { $0.id == id }
    }
}
