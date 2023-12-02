//
//  Utils.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 07/09/2023.
//

import Foundation

extension Date {
    //Helper function to more easily create a Date from year, month and day values
    static func getDateFromYMD(year: Int, month: Int, day: Int) -> Date {
        let d =  Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
        return d
    }

    static func getTupleFromDate(_ date: Date) -> (Int, Int, Int) {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        guard let year = components.year, let month = components.month, let day = components.day else {
            fatalError("Failed to extract date components")
        }

        return (year, month, day)
    }
}
