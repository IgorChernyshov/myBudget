//
//  Purchase.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct Purchase: Identifiable {
	let id = UUID()

	let name: String
	let date: Date
	let sum: Decimal
	let category: Category
	let location: Location?

	let image: UIImage?
}
