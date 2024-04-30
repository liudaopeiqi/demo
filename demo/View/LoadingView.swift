//
//  LoadingView.swift
//  demo
//
//  Created by HONGYI LIANG on 25/4/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()//create a progress indicator
            .progressViewStyle(CircularProgressViewStyle(tint: .white))//apply a circular style and set the tint color to white
            .frame(maxWidth: .infinity, maxHeight: .infinity)//expands the progress view to fill the available space
    }
}

#Preview {
    LoadingView()
}


