//
//  TaskEditView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import SwiftUI

struct TaskEditView: View {
    
    init(taskViewModel: TaskViewModel? = nil, isPresented: Binding<Bool>) {
        guard let taskViewModel else {
            self._newTaskViewModel = StateObject(wrappedValue: TaskViewModel())
            self._isPresented = isPresented
            return
        }
        
        self._newTaskViewModel = StateObject(wrappedValue: taskViewModel)
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Form {
                    TextField("Titel", text: $newTaskViewModel.title)
                    
                    DatePicker(selection: $newTaskViewModel.date, in: ...Date.now, displayedComponents: .date) {
                        Text("Datum:")
                    }
                }
                
                AddButton(icon: "checkmark", action: saveTask)
                    .padding(.bottom, 16)
            }
            .navigationBarTitle("Neue Aufgabe")
        }
    }
    
    
    
    // MARK: - Variables
    
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @StateObject var newTaskViewModel: TaskViewModel
    
    @Binding var isPresented: Bool
    
    
    
    // MARK: - Functions
    
    private func saveTask() {
        tasksViewModel.dataManager.addTask(from: newTaskViewModel)
        isPresented = false
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(isPresented: .constant(false))
    }
}
