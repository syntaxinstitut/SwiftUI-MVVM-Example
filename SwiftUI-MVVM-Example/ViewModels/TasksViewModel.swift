//
//  TasksViewModel.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import Foundation
import Combine

class TasksViewModel: ObservableObject {
    
    var cancellable: AnyCancellable?
    
    init() {
        dataManager.fetchTasks()
        
        cancellable = dataManager.tasks
            .sink { [weak self] tasks in
                self?.taskViewModels = tasks.map { TaskViewModel($0) }
            }
    }
    
    
    
    // MARK: - Variables
    
    let dataManager = DataManager.shared
    
    @Published var taskViewModels = [TaskViewModel]()
    
    
    
    // MARK: - Computed Properties
    
    var completedTasks: [TaskViewModel] {
        taskViewModels.filter { $0.isCompleted }
    }
    
    var uncompletedTasks: [TaskViewModel] {
        taskViewModels.filter { !$0.isCompleted }
    }
    
}
