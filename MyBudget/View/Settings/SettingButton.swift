//
//  SettingButton.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct SettingButton: View {

	let icon: Icon
	let title: String
	let chevronDirection: ChevronIcon.Direction

    var body: some View {
		ZStack {
			Color.background1

			HStack(spacing: 12) {
				Image(systemName: icon.rawValue)
					.foregroundStyle(Color.textSecondary)

				Text(title)
					.font(.system(size: 20, weight: .bold))

				Spacer()

				ChevronIcon(direction: chevronDirection)
			}
			.foregroundStyle(Color.textPrimary)
			.padding()
		}
		.frame(width: .infinity, height: 48)
		.cornerRadius(24)
    }
}

extension SettingButton {
	enum Icon: String {
		case globe
		case star = "star.fill"
		case bubbles = "bubble.left.and.bubble.right"
	}
}

#Preview {
	SettingButton(icon: .globe, title: "Язык", chevronDirection: .right)
}
