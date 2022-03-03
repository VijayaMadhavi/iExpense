//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Vijaya Madhavi on 01/03/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
