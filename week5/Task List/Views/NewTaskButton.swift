//
//  NewTaskButton.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/29/23.
//

import SwiftUI

struct NewTaskButton: View {
    @Binding var showSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: { showSheet = true }) {
                Image(systemName: "plus.circle.fill")
                Text("New Task")
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NewTaskButton(showSheet: .constant(false))
}
