//
//  AddPurchaseView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import SwiftUI

struct AddPurchaseView: View {

	@State private var name: String = ""
	@State private var sum: String = ""
	@State private var image: UIImage?

    var body: some View {
		VStack {
			HStack {
				Text("Добавить покупку")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()
			}
			.padding(.horizontal, 32)
			.padding(.bottom, 16)

			Spacer()

			List {
				Section("Информация о покупке") {
					TextField("Название", text: $name)

					TextField("Сумма", text: $sum)
				}
				.listRowBackground(Color.background1)

				Section("Фото покупки") {
					NavigationLink {
						CameraView(isCameraViewPresented: .constant(true), capturedImage: $image)
					} label: {
						Image(systemName: "camera")

						Text("Сделать фото")
					}

					NavigationLink {

					} label: {
						Image(systemName: "photo.on.rectangle")

						Text("Выбрать из галереи")
					}
				}
				.listRowBackground(Color.background1)
			}
			.tint(Color.textPrimary)
			.foregroundStyle(Color.textPrimary)
			.modifier(ListBackgroundModifier())

			HStack {
				Spacer()

				Button {

				} label: {
					Text("Готово")
						.font(.system(size: 16, weight: .semibold))
				}
				.tint(Color.textPrimary)
			}
			.padding(.horizontal, 32)
		}
		.background(Color.background0)
    }
}

#Preview {
    AddPurchaseView()
}
