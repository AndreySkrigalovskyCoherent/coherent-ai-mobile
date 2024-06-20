//
//  ContentView.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    private let viewModel = MLViewModel()

    var body: some View {
        MainView()
            .onAppear {
                print(viewModel.testModel())
            }
    }
}

#Preview {
    ContentView()
}
