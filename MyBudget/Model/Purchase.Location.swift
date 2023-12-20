//
//  Purchase.Location.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import CoreLocation

extension Purchase {

	struct Location: Identifiable, Codable, Equatable {
		let id: UUID
		let latitude: Double
		let longitude: Double

		var coordinate: CLLocationCoordinate2D {
			CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		}
	}
}
