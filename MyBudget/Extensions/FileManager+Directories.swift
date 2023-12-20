//
//  FileManager+Directories.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import Foundation

extension FileManager {
	static var documentsDirectory: URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}
