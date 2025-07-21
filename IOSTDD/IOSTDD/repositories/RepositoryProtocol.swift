import Foundation

protocol RepositoryProtocol: AnyObject {
    func fetchTasks() -> [Task]
}
