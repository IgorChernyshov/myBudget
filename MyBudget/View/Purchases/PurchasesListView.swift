//
//  PurchasesListView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import LocalAuthentication
import SwiftUI

struct PurchasesListView: View {

	@State private var isMasked = true

	@ObservedObject private var fileStorage = FileStorage.shared

    var body: some View {
		VStack {
			HStack {
				Text("Покупки")
					.font(.system(size: 20, weight: .bold))

				Spacer()

				Button {
					withAnimation {
						authenticate()
					}
				} label: {
					Image(systemName: isMasked ? "eye.slash" : "eye")
				}
			}
			.padding(.bottom, 16)

			Spacer()

			ScrollView(.vertical) {
				ForEach(fileStorage.purchases) { purchase in
					PurchaseView(isMasked: $isMasked, purchase: purchase)
				}
			}

			Spacer()

			HStack {
				Text("Сумма покупок:")

				Spacer()

				let sum = isMasked ? "*****" : fileStorage.purchases.reduce(into: 0, { $0 += $1.totalSum }).formatted()
				Text("\(sum) ₽")
			}
			.font(.system(size: 16, weight: .semibold))
		}
		.foregroundStyle(Color.textPrimary)
		.padding(.horizontal, 32)
		.padding(.bottom, 16)
		.background(Color.background0)
    }

	private func authenticate() {
		let context = LAContext()
		var error: NSError?

		guard isMasked, context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
			isMasked.toggle()
			return
		}

		Task {
			let reason = "Авторизуйтесь, чтобы посмотреть суммы покупок"
			let isSuccess = try? await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
															  localizedReason: reason)
			if isSuccess == true { isMasked.toggle() }
		}
	}
}

#Preview {
    PurchasesListView()
}
