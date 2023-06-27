//
//  CompletedTasksView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Syntax on 27.06.23.
//

import SwiftUI

struct CompletedTasksView: View {
    
    var body: some View {
        List {
            ForEach(tasksViewModel.completedTasks) { taskViewModel in
                TaskView()
                    .environmentObject(taskViewModel)
                    .swipeActions {
                        Button("Löschen") {
                            tasksViewModel.dataManager.deleteTask(with: taskViewModel.title)
                        }
                        .tint(.red)
                    }
            }
        }
        .navigationTitle("Erledigt")
    }
    
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var tasksViewModel: TasksViewModel
    
}

struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView()
    }
}
