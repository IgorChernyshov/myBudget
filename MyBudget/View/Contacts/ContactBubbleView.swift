//
//  ContactBubbleView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct ContactBubbleView: View {

	let name: String
	let phone: String?

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(name)
					.foregroundStyle(Color.textPrimary)

				if let phone {
					Text(phone)
						.foregroundStyle(Color.textSecondary)
				}
			}

			Spacer()
		}
		.font(.system(size: 16))
		.frame(maxWidth: .infinity)
		.padding(16)
		.background {
			Color.background1
				.opacity(0.8)
				.cornerRadius(16)
		}
	}
}

#Preview {
	ContactBubbleView(name: "Test name", phone: "Test Phone")
}
