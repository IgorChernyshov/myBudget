//
//  PurchaseDetailsView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import MapKit
import SwiftUI

struct PurchaseDetailsView: View {

	let purchase: Purchase
    
	var body: some View {
		HStack {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading) {
					Text("Вы купили \(purchase.name)")
						.font(.system(size: 20, weight: .bold))
						.padding(.bottom, 16)

					Text(purchase.date.formatted(date: .abbreviated, time: .shortened))

					Text("В категории \(purchase.category.rawValue)")

					Text("Стоимость \(purchase.sum.formatted()) ₽")

					if let image = purchase.image {
						Text("Фото покупки:")
							.padding(.top, 16)

						Image(uiImage: image)
							.resizable()
							.scaledToFit()
					}

					if let location = purchase.location {
						Text("Приобретено здесь:")
							.padding(.top, 16)

						let region = MKCoordinateRegion(center: .init(latitude: location.latitude, longitude: location.longitude),
														span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
						let coordinateRegion: Binding<MKCoordinateRegion> = .constant(region)
						Map(coordinateRegion: coordinateRegion, annotationItems: [location].compactMap { $0 }) { location in
							MapPin(coordinate: location.coordinate, tint: Color.textPrimary)
						}
						.scaledToFit()
					}

					Spacer()
				}
			}

			Spacer()
		}
		.frame(maxWidth: .infinity)
		.padding(.horizontal)
		.foregroundStyle(Color.textPrimary)
    }
}

#Preview {
	PurchaseDetailsView(purchase: .makePreview(withLocation: true, withImage: true))
}
