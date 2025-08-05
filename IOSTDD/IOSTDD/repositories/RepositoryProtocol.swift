import Foundation

protocol RepositoryProtocol: Sendable {
    func fetchTasks() async -> [TodoItem]
    func addTask(_ task: TodoItem) async
    func removeTask(by id: UUID) async
}
