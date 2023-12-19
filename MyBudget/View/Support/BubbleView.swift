//
//  BubbleView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct BubbleView: View {

	let text: String

	var body: some View {
		Text(text)
			.font(.system(size: 16))
			.foregroundStyle(Color.textPrimary)
			.padding(16)
			.background {
				Color.background1
					.opacity(0.8)
					.cornerRadius(16)
			}
    }
}

#Preview {
	BubbleView(text: "Test message")
}
