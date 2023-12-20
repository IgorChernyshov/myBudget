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
				PurchasesListView()
					.tabItem {
						Image(systemName: "doc.plaintext")
						Text("Покупки")
					}

				AddPurchaseView()
					.tabItem {
						Image(systemName: "cart.badge.plus")
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
