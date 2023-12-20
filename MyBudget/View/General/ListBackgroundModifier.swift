//
//  ListBackgroundModifier.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import SwiftUI

struct ListBackgroundModifier: ViewModifier {

	@ViewBuilder
	func body(content: Content) -> some View {
		if #available(iOS 16.0, *) {
			content
				.scrollContentBackground(.hidden)
		} else {
			content
		}
	}
}
