//
//  Errors.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 08/09/2023.
//

import Foundation

enum PredictionError: Error {
    case ageOutOfRangeError
    case monthOutOfRangeError

}

var errorMessages = [
    PredictionError.ageOutOfRangeError: "Age must be 18-45",
    PredictionError.monthOutOfRangeError: "Month mustt be 1-12",
]
