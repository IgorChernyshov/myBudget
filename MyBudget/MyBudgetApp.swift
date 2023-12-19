//
//  MyBudgetApp.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

@main
struct MyBudgetApp: App {

	init() {
		UITabBar.appearance().backgroundColor = UIColor(Color.background1)
	}

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
