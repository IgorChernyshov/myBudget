//
//  PurchaseView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import SwiftUI

struct PurchaseView: View {

	@Binding var isMasked: Bool
	let purchase: Purchase

    var body: some View {
		NavigationLink {
			PurchaseDetailsView(purchase: purchase)
		} label: {
			HStack {
				VStack(alignment: .leading) {
					let sum = isMasked ? "*****" : purchase.sum.formatted()
					Text("\(purchase.name): \(sum) ₽")

					Text("Категория: \(purchase.category.rawValue)")
					Text(purchase.date.formatted(date: .abbreviated, time: .shortened))
						.foregroundStyle(Color.textSecondary)
				}

				Spacer()

				if purchase.location != nil {
					Image(systemName: "globe")
				}

				if purchase.image != nil {
					Image(systemName: "photo")
				}

				// if purchase.isShared

				ChevronIcon(direction: .right)
					.padding(.leading)
			}
			.font(.system(size: 16))
			.frame(maxWidth: .infinity)
			.padding(16)
			.foregroundStyle(Color.textPrimary)
			.background {
				Color.background1
					.opacity(0.8)
					.cornerRadius(16)
			}
		}
    }
}

#Preview {
	PurchaseView(isMasked: .constant(false), purchase: .makePreview(withLocation: true, withImage: true))
}
