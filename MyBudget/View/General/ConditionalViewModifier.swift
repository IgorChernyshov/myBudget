//
//  ConditionalViewModifier.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

extension View {
	@ViewBuilder 
	func `if`<Content: View>(_ condition: @autoclosure () -> Bool, modifier: (Self) -> Content) -> some View {
		if condition() {
			modifier(self)
		} else {
			self
		}
	}
}
