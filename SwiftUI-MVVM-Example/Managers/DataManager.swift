//
//  DataManager.swift
//  SwiftUI-MVVM-Example
//
//  Created by Syntax on 27.06.23.
//

import Foundation
import Combine

fileprivate var dummyTasks = [Task(title: "Kochen", isCompleted: true, date: Date()),
                              Task(title: "Putzen", isCompleted: true, date: Date()),
                              Task(title: "Aufräumen", isCompleted: true, date: Date()),
                              Task(title: "Programmieren", isCompleted: false, date: Date()),
                              Task(title: "Waschen", isCompleted: false, date: Date()),
                              Task(title: "Saugen", isCompleted: false, date: Date())]

class DataManager {
    
    // MARK: - Variables
    
    static let shared = DataManager()
    
    var tasks = CurrentValueSubject<[Task], Never>([])
    
    
    
    // MARK: - Functions
    
    func fetchTasks() {
        tasks.send(dummyTasks)
    }
    
    func addTask(from taskViewModel: TaskViewModel) {
        dummyTasks.append(Task(title: taskViewModel.title, isCompleted: taskViewModel.isCompleted, date: taskViewModel.date))
        fetchTasks()
    }
    
    func completeTask(with title: String) {
        guard let index = getIndex(with: title) else { return }
        dummyTasks[index] = Task(title: title, isCompleted: true, date: Date())
        
        fetchTasks()
    }
    
    func deleteTask(with title: String) {
        guard let index = getIndex(with: title) else { return }
        dummyTasks.remove(at: index)
        
        fetchTasks()
    }
    
    private func getIndex(with title: String) -> Int? {
        dummyTasks.firstIndex(where: { $0.title == title })
    }
    
}
