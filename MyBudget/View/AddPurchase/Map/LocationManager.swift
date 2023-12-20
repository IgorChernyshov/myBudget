//
//  LocationManager.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

	private let manager = CLLocationManager()

	@Published var location: CLLocationCoordinate2D?

	override init() {
		super.init()
		manager.delegate = self
	}

	func requestLocation() {
		manager.requestLocation()
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		location = locations.first?.coordinate
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
}
