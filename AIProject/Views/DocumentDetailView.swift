//
//  DocumentDetailView.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import SwiftUI

struct DocumentDetailView: View {
    @State private var isLoading = false
    @State private var error: Error?
    let document: Document
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
            } else if let error = error {
                VStack {
                    Text("An error occurred:")
                    Text(error.localizedDescription)
                }
            } else {
                ScrollView {
                    Text(document.content)
                        .padding()
                }
                .navigationTitle(document.title)
            }
        }
        .onAppear(perform: loadDocument)
    }
    
    private func loadDocument() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
        }
    }
}
