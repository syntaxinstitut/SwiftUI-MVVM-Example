//
//  TasksView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 21.06.23.
//

import SwiftUI

enum Navigator {
    case info, completed
}

struct TasksView: View {
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(tasksViewModel.uncompletedTasks) { taskViewModel in
                        TaskView()
                            .environmentObject(taskViewModel)
                            .swipeActions {
                                Button("Erledigt") {
                                    tasksViewModel.dataManager.completeTask(with: taskViewModel.title)
                                }
                                .tint(.green)
                            }
                    }
                }
                
                AddButton(icon: "plus", action: showAdd)
                    .padding(.bottom, 16)
            }
            .navigationTitle("Aufgaben")
            .toolbar {
                NavigationLink(value: Navigator.info) {
                    Image(systemName: "info.circle")
                }
                
                NavigationLink(value: Navigator.completed) {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            .navigationDestination(for: Navigator.self) { navigation in
                switch navigation {
                case .completed:
                    CompletedTasksView()
                        .environmentObject(tasksViewModel)
                case .info:
                    InfoView()
                }
            }
            .sheet(isPresented: $showAddTask) {
                TaskEditView(isPresented: $showAddTask)
                    .environmentObject(tasksViewModel)
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var tasksViewModel = TasksViewModel()
    
    @State private var showCompletedTasks = false
    @State private var showAddTask = false
    
    
    
    // MARK: - Functions
    
    private func showAdd() {
        showAddTask.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
