//
//  DocumentSearchViewModel.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import Foundation
import Combine

final class DocumentSearchViewModel: ObservableObject {
    enum SortOption: String, CaseIterable {
        case relevance = "Relevance"
        case date = "Date"
        case alphabetical = "Alphabetical"
    }

    enum DateFilter: String, CaseIterable {
        case all = "All"
        case lastMonth = "Last Month"
        case lastYear = "Last Year"
        case custom = "Custom"
    }

    @Published var searchText = ""
    @Published var searchResults = [Document]()
    @Published var sortOption = SortOption.relevance
    @Published var selectedDocumentType: Document.DocumentType?
    @Published var selectedDateFilter = DateFilter.all

    private var cancellable: AnyCancellable?

    init() {
        cancellable = $searchText
            .combineLatest($sortOption, $selectedDocumentType, $selectedDateFilter)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates { ($0.0, $0.1, $0.2, $0.3) == ($1.0, $1.1, $1.2, $1.3) }
            .map { [weak self] keywords, sortOption, documentType, dateFilter in
                guard let self else { return [] }

                return self.sortDocuments(
                    self.filterDocuments(
                        DataSource.shared.searchDocuments(with: keywords),
                        type: documentType,
                        dateFilter: dateFilter),
                    by: sortOption)
            }
            .assign(to: \.searchResults, on: self)
    }

    func resetFilters() {
        selectedDocumentType = nil
        selectedDateFilter = .all
        updateSearchResults()
    }

    func updateSearchResults() {
        searchResults = sortDocuments(
            filterDocuments(
                DataSource.shared.searchDocuments(with: searchText),
                type: selectedDocumentType,
                dateFilter: selectedDateFilter),
            by: sortOption)
    }

    private func sortDocuments(
        _ documents: [Document],
        by option: SortOption
    ) -> [Document] {
        switch option {
        case .relevance:
            documents.sorted {
                $0.title.localizedCaseInsensitiveContains(searchText) &&
                !$1.title.localizedCaseInsensitiveContains(searchText)
            }
        case .date:
            documents.sorted { $0.date > $1.date }
        case .alphabetical:
            documents.sorted { $0.title < $1.title }
        }
    }

    private func filterDocuments(
        _ documents: [Document],
        type: Document.DocumentType?,
        dateFilter: DateFilter
    ) -> [Document] {
        var filteredDocuments = documents

        if let type = type {
            filteredDocuments = filteredDocuments.filter { $0.type == type }
        }

        switch dateFilter {
        case .all:
            break
        case .lastMonth:
            if let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date()) {
                filteredDocuments = filteredDocuments.filter { $0.date >= oneMonthAgo }
            }
        case .lastYear:
            if let oneYearAgo = Calendar.current.date(byAdding: .year, value: -1, to: Date()) {
                filteredDocuments = filteredDocuments.filter { $0.date >= oneYearAgo }
            }
        case .custom:
            break
        }

        return filteredDocuments
    }
}
