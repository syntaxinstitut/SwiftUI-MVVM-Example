//
//  TaskView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import SwiftUI

struct TaskView: View {
    
    var body: some View {
        HStack {
            Text(taskViewModel.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let date = taskViewModel.date {
                Text(date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(TaskViewModel(Task(title: "Aufgabe", isCompleted: false, date: Date())))
    }
}
