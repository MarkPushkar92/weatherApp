//
//  MainViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 05.02.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController, Coordinating {
    
    weak var coordinator: Coordinator?
    
    private(set) lazy var currentLocationProvider: CurrentLocationProvider = {
        return CurrentLocationProvider()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let onBoardingView = MainScreenView(viewFrame: self.view.frame)
        view = onBoardingView
    }

    func setupViewForMode(_ mode : OnboardingMode) {
        let geoLocations = getGeoItemNames(mode: mode)
        setupView(geoItems: geoLocations)
        
        if mode == .withCurrentLocation {
            currentLocationProvider.locationUpdateCallback = { location in

                let dbGeoPoint = DbGeoPoint(id: AppCommonStrings.currentLocationLabel,
                                        latitude: Float(location.coordinate.latitude),
                                        longitude: Float(location.coordinate.longitude))

                GeoPointsDB.shared.addGeoPoint(geoPoint: dbGeoPoint)

                DispatchQueue.main.async { [weak self] in
                    if let ui = self?.view as? MainView {
                        ui.addNewCity(cityName: AppCommonStrings.currentLocationLabel)
                    }
                }
            }

            currentLocationProvider.updateLocation()
        }
    }
}


