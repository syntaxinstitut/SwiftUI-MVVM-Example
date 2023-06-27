//
//  TaskViewModel.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import Foundation

class TaskViewModel: ObservableObject, Identifiable {
    
    init(_ task: Task) {
        self.id = task.id
        
        self.title = task.title
        self.isCompleted = task.isCompleted
        self.date = task.date
    }
    
    init() {
        self.id = UUID().uuidString
        
        self.title = ""
        self.isCompleted = false
        self.date = Date()
    }
    
    
    
    // MARK: - Variables
    
    let id: String
    
    @Published var title: String
    @Published var isCompleted: Bool
    @Published var date: Date
    
}
