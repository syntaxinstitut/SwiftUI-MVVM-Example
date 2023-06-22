//
//  TasksViewModel.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import Foundation

class TasksViewModel: ObservableObject {
    
    init() {
        let tasks = [Task(title: "Variablen", isCompleted: true, date: Date()),
                     Task(title: "Arrays", isCompleted: true, date: Date()),
                     Task(title: "Set & Dictionaries", isCompleted: true, date: Date()),
                     Task(title: "If/Else", isCompleted: false),
                     Task(title: "Structs", isCompleted: false),
                     Task(title: "Klassen", isCompleted: false)]
        
        self.taskViewModels = tasks.map { TaskViewModel($0) }
    }
    
    
    
    // MARK: - Variables
    
    @Published var taskViewModels = [TaskViewModel]()
    
    
    
    // MARK: - Computed Properties
    
    var completedTasks: [TaskViewModel] {
        taskViewModels.filter { $0.isCompleted }
    }
    
    var uncompletedTasks: [TaskViewModel] {
        taskViewModels.filter { !$0.isCompleted }
    }
    
}
