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
            } else if let error {
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
        .onAppear {
            Task {
                try await loadDocument()
            }
        }
    }
    
    private func loadDocument() async throws {
        isLoading = true

        try await Task.sleep(nanoseconds: 1_000_000_000)

        isLoading = false
    }
}
