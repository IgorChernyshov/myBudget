//
//  FileStorage.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import UIKit

final class FileStorage: ObservableObject {

	@Published var purchases = [Purchase]()

	private let fileManager = FileManager.default
	private let savePath = FileManager.documentsDirectory

	private init() {
		do {
			let data = try Data(contentsOf: savePath.appendingPathComponent("Purchases"))
			purchases = try JSONDecoder().decode([Purchase].self, from: data)
		} catch {
			purchases = []
		}
	}

	static let shared = FileStorage()

	func add(_ purchase: Purchase) {
		do {
			purchases.append(purchase)

			let data = try JSONEncoder().encode(purchases)
			try data.write(to: savePath.appendingPathComponent("Purchases"))
		} catch {
			return
		}
	}

	func loadAllPurchases() {
		do {
			let data = try Data(contentsOf: savePath.appendingPathComponent("Purchases"))
			purchases = try JSONDecoder().decode([Purchase].self, from: data)
		} catch {
			return
		}
	}

	func loadImage(withName: String) -> UIImage? {
		UIImage(contentsOfFile: savePath.appendingPathComponent(withName).absoluteString)
	}

	func save(_ image: UIImage, withName: String) {
		do {
			let data = try JSONEncoder().encode(image.jpegData(compressionQuality: 0.8))
			try data.write(to: savePath.appendingPathComponent(withName))
		} catch {
			return
		}
	}
}
