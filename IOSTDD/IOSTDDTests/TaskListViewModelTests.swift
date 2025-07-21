import XCTest
@testable import IOSTDD

final class TaskListViewModelTests: XCTestCase {

    var stubRepository: RepositoryProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        stubRepository = EmptyStubRepository()
    }
    override func tearDownWithError() throws {
        stubRepository = nil
        try super.tearDownWithError()
    }

    @MainActor
    func testTasks_AreEmptyOnInit() {
        let viewModel = TaskListViewModel(repository: stubRepository)
        XCTAssertTrue(viewModel.tasks.isEmpty, "TaskListViewModel should start with an empty task list.")
    }

    @MainActor
    func testAddTask_IncreasesTaskCount() {
        let viewModel = TaskListViewModel(repository: stubRepository)
        viewModel.addTask(title: "Test Task")
        XCTAssertEqual(viewModel.tasks.count, 1, "Adding a task should increase the task count.")
        XCTAssertEqual(viewModel.tasks.first?.title, "Test Task", "The added task should have the correct title.")
    }

    @MainActor
    func testRemoveTask_DecreasesTaskCount() {
        let viewModel = TaskListViewModel(repository: stubRepository)
        viewModel.addTask(title: "Task to Remove")
        let task = viewModel.tasks.first!
        viewModel.removeTask(id: task.id)
        XCTAssertTrue(viewModel.tasks.isEmpty, "Removing a task should result in an empty task list.")
    }

    @MainActor
    func testAddTask_IgnoresEmptyOrWhitespaceTitle() {
        let viewModel = TaskListViewModel(repository: stubRepository)
        viewModel.addTask(title: "")
        viewModel.addTask(title: "   ")
        XCTAssertTrue(viewModel.tasks.isEmpty, "Tasks with empty or whitespace-only titles should not be added.")
    }

    @MainActor
    func testInit_withFakeRepository_loadsStubTasks() {
        let viewModel = TaskListViewModel(repository: FakeRepository())
        XCTAssertEqual(viewModel.tasks.map(\.title),
                       ["Stub Task 1", "Stub Task 2"],
                       "TaskListViewModel should load tasks from the stub repository on init.")
    }
}
