//
//  MLViewModel.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 4/19/24.
//

import Foundation
import CoreML

final class MLViewModel {
    func testModel() -> Double {
        var value: Double

        do {
            let configuration = MLModelConfiguration()
            let model = try SalaryModel(configuration: configuration)
            let prediction = try model.prediction(yearOfExperience: 20)

            value = prediction.salary
        } catch {
            fatalError(error.localizedDescription)
        }

        return value
    }
}
