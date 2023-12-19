//
//  MainView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct MainView: View {

	var body: some View {
		TabView {
			Text("Экран трат")
				.tabItem {
					Image(systemName: "doc.plaintext")
					Text("Траты")
				}

			Text("Экран скана")
				.tabItem {
					Image(systemName: "doc.text.viewfinder")
					Text("Сканировать чек")
				}

			Text("Экран разделить чек")
				.tabItem {
					Image(systemName: "person.2")
					Text("Разделить чек")
				}

			SettingsView()
				.tabItem {
					Image(systemName: "gear")
					Text("Настройки")
				}
		}
		.tint(Color.textPrimary)
	}
}

#Preview {
	MainView()
}
