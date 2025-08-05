import Foundation

struct TodoItem: Identifiable, Sendable {
  let id = UUID()
  let title: String
}


