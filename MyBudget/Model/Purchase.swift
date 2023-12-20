//
//  Purchase.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct Purchase: Identifiable, Codable {
	var id = UUID()

	let name: String
	var date = Date.now
	let sum: Decimal
	let category: Category
	let sharedWith: String?
	let imageName: String?
	let location: Location?

	var totalSum: Decimal {
		sharedWith != nil ? sum / 2 : sum
	}

	var image: UIImage? {
		FileStorage.shared.loadImage(withName: "Image\(name)\(sum)\(category)")
	}
}

extension Purchase {
	static var previewWithLocationAndImage: Self {
		makePreview(isShared: true, withLocation: true, withImage: true)
	}

	static func makePreview(isShared: Bool, withLocation: Bool, withImage: Bool) -> Self {
		.init(name: "Покупка",
			  sum: 300,
			  category: Category.allCases.randomElement() ?? .miscellaneous, 
			  sharedWith: isShared ? "Кем-то" : nil,
			  imageName: withImage ? "Фото" : nil,
			  location: withLocation ? .init(id: UUID(), latitude: 1, longitude: 1) : nil)
	}
}
