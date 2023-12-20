//
//  CLLocationCoordinate2D+Convertion.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import CoreLocation

extension CLLocationCoordinate2D {
	var asPurchaseLocation: Purchase.Location? {
		Purchase.Location(id: UUID(), latitude: latitude, longitude: longitude)
	}
}
