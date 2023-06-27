//
//  Task.swift
//  SwiftUI-MVVM-Example
//
//  Created by Kevin Waltz on 22.06.23.
//

import Foundation

struct Task: Codable, Hashable, Identifiable {
    var id = UUID().uuidString
    
    var title: String
    var isCompleted: Bool
    var date: Date
}
