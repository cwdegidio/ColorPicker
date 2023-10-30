//
//  ListItem.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct ListItem: View {
    @State var name: String
    @State var desc: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(desc)
            HStack {
                Image(systemName: "camera")
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    ListItem(name: "Curtis DeGidio", desc: "Man sitting with pile of metal tins")
}
