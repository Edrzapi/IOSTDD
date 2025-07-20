import Foundation

@MainActor
final class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [Task] = []
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        tasks.append(Task(title: trimmed))
    }
    
    func removeTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }
}
