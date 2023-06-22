//
//  TasksView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 21.06.23.
//

import SwiftUI

struct TasksView: View {
    
    var body: some View {
        NavigationStack {
            List {
                uncompletedSection
                completedSection
            }
            .navigationTitle("Tasks")
        }
    }
    
    private var uncompletedSection: some View {
        Section {
            ForEach(tasksViewModel.uncompletedTasks) { taskViewModel in
                TaskView()
                    .environmentObject(taskViewModel)
            }
        }
    }
    
    private var completedSection: some View {
        Section {
            DisclosureGroup("Completed Tasks", isExpanded: $showCompletedTasks) {
                ForEach(tasksViewModel.completedTasks) { taskViewModel in
                    TaskView()
                        .environmentObject(taskViewModel)
                }
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var tasksViewModel = TasksViewModel()
    
    @State private var showCompletedTasks = false
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
