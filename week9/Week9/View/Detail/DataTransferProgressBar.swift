//
//  DataTransferProgressBar.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct DataTransferProgressBar: View {
    var loadingProgress: Double
    
    var body: some View {
        VStack {
            ProgressView("Loading...", value: loadingProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
            Text("Progress: \(Int(loadingProgress * 100))%")
        }
    }
}

#Preview {
    DataTransferProgressBar(loadingProgress: 0.54)
}
