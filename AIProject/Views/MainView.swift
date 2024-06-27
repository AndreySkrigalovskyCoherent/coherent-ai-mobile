//
//  MainView.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                NavigationLink {
                    DocumentSearchView()
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Start Searching")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
            .padding(.bottom, 50)
            .background(
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {
    MainView()
}
