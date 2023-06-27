//
//  InfoView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Syntax on 27.06.23.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        VStack(spacing: 36) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 120)
            
            Text("Syntax-Demo")
                .font(.headline)
                .foregroundColor(.white)
                .padding(16)
                .background(Color.accentColor)
                .cornerRadius(8)
        }
        .navigationTitle("Info")
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
