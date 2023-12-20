//
//  PurchaseMapView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import MapKit
import SwiftUI

struct PurchaseMapView: View {

	private var locations: [Purchase.Location] {
		FileStorage.shared.purchases.compactMap { $0.location }
	}

	@State private var region: MKCoordinateRegion

	init() {
		self.region = MKCoordinateRegion(center: FileStorage.shared.purchases.compactMap { $0.location }.first?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
	}

	var body: some View {
		VStack {
			HStack {
				Text("Карта покупок")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()
			}
			.padding(.horizontal, 32)
			.padding(.bottom, 16)

			Map(coordinateRegion: $region, annotationItems: locations) { location in
				MapPin(coordinate: location.coordinate, tint: Color.textPrimary)
			}
			.ignoresSafeArea()
		}
		.tint(Color.textPrimary)
	}
}

#Preview {
	PurchaseMapView()
}
