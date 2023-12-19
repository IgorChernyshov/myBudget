//
//  SettingsView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import StoreKit
import SwiftUI

struct SettingsView: View {
    var body: some View {
		VStack {
			HStack {
				Text("Настройки")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()
			}

			Spacer()

			VStack {
				Button {
					openAppSettings()
				} label: {
					SettingButton(icon: .globe, title: "Язык", chevronDirection: .down)
				}

				Button {
					requestReview()
				} label: {
					SettingButton(icon: .star, title: "Оставить отзыв", chevronDirection: .down)
				}

				NavigationLink {
					SupportView()
				} label: {
					SettingButton(icon: .globe, title: "Поддержка", chevronDirection: .right)
				}
			}

			Spacer()
		}
		.padding(.horizontal, 32)
		.background(Color.background0)
    }

	private func openAppSettings() {
		guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
		UIApplication.shared.open(url)
	}

	private func requestReview() {
		guard let currentScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
		SKStoreReviewController.requestReview(in: currentScene)
	}
}

#Preview {
	NavigationView {
		SettingsView()
	}
}
