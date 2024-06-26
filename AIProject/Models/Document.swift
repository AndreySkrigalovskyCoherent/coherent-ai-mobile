//
//  Document.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import Foundation

struct Document: Identifiable {
    enum DocumentType: String, CaseIterable, Identifiable {
        case policy = "Policy"
        case procedure = "Procedure"
        case instruction = "Instruction"
        case report = "Report"
        case other = "Other"

        var id: String { rawValue }
    }

    let id: UUID
    let title: String
    let content: String
    let date: Date
    let type: DocumentType
    let summary: String

    init(
        id: UUID = UUID(),
        title: String,
        content: String,
        date: Date,
        type: DocumentType,
        summary: String
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.type = type
        self.summary = summary
    }
}
