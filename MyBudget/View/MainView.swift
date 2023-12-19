//
//  MainView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct MainView: View {

	var body: some View {
		NavigationView {
			TabView {
				PurchasesView()
					.tabItem {
						Image(systemName: "doc.plaintext")
						Text("Покупки")
					}

				Text("Экран скана")
					.tabItem {
						Image(systemName: "doc.text.viewfinder")
						Text("Добавить")
					}

				ContactsView()
					.tabItem {
						Image(systemName: "person.2")
						Text("Разделить")
					}

				SettingsView()
					.tabItem {
						Image(systemName: "gear")
						Text("Настройки")
					}
			}
		}
		.tint(Color.textPrimary)
	}
}

#Preview {
	MainView()
}
