

final class EmptyStubRepository: RepositoryProtocol {

    func fetchTasks() -> [Task] { [] }
    
    func addTask(_ task: Task) { }
    
    func removeTask(_ task: Task) { }
}


