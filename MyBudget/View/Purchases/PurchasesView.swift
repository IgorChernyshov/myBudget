//
//  PurchasesView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import LocalAuthentication
import SwiftUI

struct PurchasesView: View {

	@State private var isMasked = true

	@State private var purchases: [Purchase] = [
		.init(name: "Foo", date: .now, sum: 30, category: .clothing, image: nil),
		.init(name: "Bar", date: .now, sum: 300, category: .healthAndWellness, image: nil),
		.init(name: "Foo Bar", date: .now, sum: 3000, category: .clothing, image: nil)
	]

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
				ForEach(purchases) { purchase in
					HStack {
						VStack(alignment: .leading) {
							let sum = isMasked ? "*****" : purchase.sum.formatted()
							Text("\(purchase.name): \(sum) ₽")

							Text(purchase.date.formatted(date: .abbreviated, time: .shortened))
								.foregroundStyle(Color.textSecondary)
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

			Spacer()

			HStack {
				Text("Сумма покупок:")

				Spacer()

				let sum = isMasked ? "*****" : purchases.reduce(into: 0, { $0 += $1.sum }).formatted()
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
    PurchasesView()
}
