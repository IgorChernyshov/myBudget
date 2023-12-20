//
//  MapView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import MapKit
import SwiftUI

struct MapView: View {

	@Binding var isMapViewPresented: Bool
	@Binding var selectedPlace: Purchase.Location?

	@StateObject private var locationManager = LocationManager()
	@State private var region =
		MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

	var body: some View {
		ZStack {
			VStack {
				HStack {
					Button {
						isMapViewPresented = false
					} label: {
						Text("Готово")
					}

					Spacer()
				}
				.padding(.horizontal, 16)

				let place = selectedPlace ?? locationManager.location?.asPurchaseLocation
				Map(coordinateRegion: $region, annotationItems: [place].compactMap { $0 }) { location in
					MapPin(coordinate: location.coordinate, tint: Color.textPrimary)
				}
				.ignoresSafeArea()

				HStack {
					Button {
						selectedPlace = region.center.asPurchaseLocation
					} label: {
						Text("Поставить точку")
					}

					Spacer()

					Button {
						selectedPlace = nil
						locationManager.requestLocation()
					} label: {
						Text("Найти меня")
					}
				}
				.padding(.horizontal, 16)
			}
			.tint(Color.textPrimary)

			Circle()
				.foregroundStyle(Color.textSecondary)
				.frame(width: 20, height: 20)
		}
	}
}

#Preview {
	MapView(isMapViewPresented: .constant(true), selectedPlace: .constant(nil))
}
