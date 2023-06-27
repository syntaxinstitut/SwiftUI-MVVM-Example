//
//  AddButton.swift
//  SwiftUI-MVVM-Example
//
//  Created by Syntax on 27.06.23.
//

import SwiftUI

struct AddButton: View {
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.white)
                .padding(24)
        }
        .background(Color.accentColor)
        .clipShape(Circle())
    }
    
    
    
    // MARK: - Variables
    
    let icon: String
    let action: () -> Void
    
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(icon: "plus", action: {})
    }
}
