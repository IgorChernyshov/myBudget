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

extension Purchase {
	static var previewWithLocationAndImage: Self {
		makePreview(withLocation: true, withImage: true)
	}

	static func makePreview(withLocation: Bool, withImage: Bool) -> Self {
		.init(name: "Foo",
			  date: .now,
			  sum: 300,
			  category: Category.allCases.randomElement() ?? .miscellaneous,
			  location: withLocation ? .init(id: UUID(), latitude: 1, longitude: 1) : nil,
			  image: withImage ? UIImage() : nil)
	}
}
