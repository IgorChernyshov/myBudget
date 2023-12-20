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
	let sharedWith: String?
	let image: UIImage?
	let location: Location?

	var totalSum: Decimal {
		sharedWith != nil ? sum / 2 : sum
	}
}

extension Purchase {
	static var previewWithLocationAndImage: Self {
		makePreview(isShared: true, withLocation: true, withImage: true)
	}

	static func makePreview(isShared: Bool, withLocation: Bool, withImage: Bool) -> Self {
		.init(name: "Покупка",
			  date: .now,
			  sum: 300,
			  category: Category.allCases.randomElement() ?? .miscellaneous, 
			  sharedWith: isShared ? "Кем-то" : nil,
			  image: withImage ? UIImage() : nil,
			  location: withLocation ? .init(id: UUID(), latitude: 1, longitude: 1) : nil)
	}
}
