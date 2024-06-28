//
//  Document.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import Foundation

enum DocumentType: String, CaseIterable, Identifiable {
    case policy = "Policy"
    case procedure = "Procedure"
    case instruction = "Instruction"
    case report = "Report"
    case other = "Other"
    
    var id: String { self.rawValue }
}

struct Document: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: Date
    let type: DocumentType
    let summary: String
}
