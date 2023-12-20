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
	@State private var category: Purchase.Category = .miscellaneous
	@State private var image: UIImage?
	@State private var location: Purchase.Location?
	@State private var sharedWith: String?

	@State private var isMapViewPresented = false
	@State private var isContactsViewPresented = false
	@State private var isCameraViewPresented = false
	@State private var isGaleryViewPresented = false

    var body: some View {
		VStack {
			HStack {
				Text("Добавить покупку")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()

				Button {
					// TODO: Save purchase
				} label: {
					Text("Готово")
						.font(.system(size: 16, weight: .semibold))
				}
				.tint(Color.textPrimary)
			}
			.padding(.horizontal, 32)
			.padding(.bottom, 16)

			Spacer()

			List {
				Section("Информация о покупке") {
					TextField("Название", text: $name)

					TextField("Сумма", text: $sum)

					Picker("Категория", selection: $category) {
						ForEach(Purchase.Category.allCases, id: \.self) { category in
							Text(category.rawValue)
						}
					}

					Button("Где сделана покупка", systemImage: "globe") {
						withAnimation {
							isMapViewPresented.toggle()
						}
					}

					Button("Совместная покупка", systemImage: "person.2") {
						withAnimation {
							isContactsViewPresented.toggle()
						}
					}
				}
				.listRowBackground(Color.background1)

				Section("Фото покупки") {
					if let image {
						Image(uiImage: image)
							.resizable()
							.scaledToFit()

						Button("Удалить фото") {
							withAnimation {
								self.image = nil
							}
						}
					} else {
						Button("Сделать фото", systemImage: "camera") {
							withAnimation {
								isCameraViewPresented.toggle()
							}
						}

						Button("Выбрать из галереи", systemImage: "photo.on.rectangle") {
							withAnimation {
								isGaleryViewPresented.toggle()
							}
						}
					}
				}
				.listRowBackground(Color.background1)
			}
			.tint(Color.textPrimary)
			.foregroundStyle(Color.textPrimary)
			.modifier(ListBackgroundModifier())
		}
		.background(Color.background0)
		.fullScreenCover(isPresented: $isMapViewPresented) {
			MapView(isMapViewPresented: $isMapViewPresented, selectedPlace: $location)
		}
		.fullScreenCover(isPresented: $isContactsViewPresented) {
			ContactsView(isContactsViewPresented: $isContactsViewPresented, pickedContact: $sharedWith)
		}
		.fullScreenCover(isPresented: $isCameraViewPresented) {
			CameraView(isCameraViewPresented: $isCameraViewPresented, capturedImage: $image)
				.edgesIgnoringSafeArea(.all)
		}
		.fullScreenCover(isPresented: $isGaleryViewPresented) {
			GalleryView(selectedPhoto: $image)
				.edgesIgnoringSafeArea(.all)
		}
    }
}

#Preview {
    AddPurchaseView()
}
