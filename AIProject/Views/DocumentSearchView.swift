//
//  DocumentSearchView.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import SwiftUI

struct DocumentSearchView: View {
    @StateObject private var viewModel = DocumentSearchViewModel()

    var body: some View {
        VStack {
            HStack {
                TextField("Search for documents", text: $viewModel.searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                Button {
                    viewModel.updateSearchResults()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            VStack {
                Picker("Sort By", selection: $viewModel.sortOption) {
                    ForEach(DocumentSearchViewModel.SortOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .onChange(of: viewModel.sortOption) {
                    viewModel.updateSearchResults()
                }

                HStack {
                    Picker("Document Type", selection: $viewModel.selectedDocumentType) {
                        Text("All")
                            .tag(Document.DocumentType?.none)
                        ForEach(Document.DocumentType.allCases) { type in
                            Text(type.rawValue)
                                .tag(type as Document.DocumentType?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: viewModel.selectedDocumentType) {
                        viewModel.updateSearchResults()
                    }
                    .frame(maxWidth: .infinity)

                    Picker("Date", selection: $viewModel.selectedDateFilter) {
                        ForEach(DocumentSearchViewModel.DateFilter.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                                .tag(filter)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: viewModel.selectedDateFilter) {
                        viewModel.updateSearchResults()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)

                Button("Reset Filters") {
                    viewModel.resetFilters()
                }
                .padding(.vertical, 10)
            }

            if viewModel.searchResults.isEmpty && !viewModel.searchText.isEmpty {
                VStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    Text("No documents found. Please refine your search criteria.")
                        .foregroundColor(.gray)

                    Spacer()
                }
                .padding()
            } else {
                List(viewModel.searchResults) { document in
                    NavigationLink(destination: DocumentDetailView(document: document)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(document.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(document.summary)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Document Search")
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
    }
}
