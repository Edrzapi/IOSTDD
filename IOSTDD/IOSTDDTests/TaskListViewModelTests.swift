import XCTest
@testable import IOSTDD

final class TaskListViewModelTests: XCTestCase {

    // MARK: — Loading tasks
    @MainActor
    func testLoadTasks_PopulatesTasksFromRepository() async {
        let repository = FakeRepository() // default seeds: ["Stub Task 1", "Stub Task 2"]
        let service = TaskService(repository: repository)
        let viewModel = TaskListViewModel(service: service)

        await viewModel.loadTasks()

        XCTAssertEqual(viewModel.tasks.map(\.title),
                       ["Stub Task 1", "Stub Task 2"],
                       "After calling loadTasks(), the viewModel should reflect the repository's seed data.")
    }

    // MARK: — Adding tasks
    @MainActor
    func testAddTask_AppendsToViewModelAndRepository() async {
        let repository = FakeRepository(seedTasks: [])
        let service = TaskService(repository: repository)
        let viewModel = TaskListViewModel(service: service)

        await viewModel.addTask(title: "New")

        XCTAssertEqual(viewModel.tasks.count, 1,
                       "Calling addTask should increase the viewModel’s tasks count.")

        let repoTasks = await repository.fetchTasks()
        XCTAssertEqual(repoTasks.count, 1,
                       "Calling addTask should also update the repository’s storedTasks.")
    }

    @MainActor
    func testAddTask_IgnoresEmptyTitle() async {
        let repository = FakeRepository(seedTasks: [])
        let service = TaskService(repository: repository)
        let viewModel = TaskListViewModel(service: service)

        await viewModel.addTask(title: "")
        await viewModel.addTask(title: "   ")

        XCTAssertTrue(viewModel.tasks.isEmpty,
                      "Passing empty or whitespace-only titles should not add tasks to the viewModel.")

        let repoTasks = await repository.fetchTasks()
        XCTAssertTrue(repoTasks.isEmpty,
                      "Passing invalid titles should not modify the repository.")
    }

    // MARK: — Removing tasks
    @MainActor
    func testRemoveTask_RemovesFromViewModelAndRepository() async {
        let task = TodoItem(title: "To Remove")
        let repository = FakeRepository(seedTasks: [task])
        let service = TaskService(repository: repository)
        let viewModel = TaskListViewModel(service: service)

        await viewModel.removeTask(id: task.id)

        XCTAssertTrue(viewModel.tasks.isEmpty,
                      "After removeTask, the viewModel’s tasks should be empty.")

        let repoTasks = await repository.fetchTasks()
        XCTAssertTrue(repoTasks.isEmpty,
                      "After removeTask, the repository’s storedTasks should be empty.")
    }
}
