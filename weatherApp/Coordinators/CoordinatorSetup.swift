//
//  CoordinatorSetup.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

// Completed File

import Foundation
import UIKit

protocol Coordinating : AnyObject {
    var coordinator : Coordinator? { get set }
}

enum CoordinatorEvent {
    case onboardingViewToMainViewEvent(OnboardingMode)
    case mainViewToSettingsViewEvent
    case settingsViewToMainViewEvent
    case mainViewToDaySummaryViewEvent(String?, WeatherDataMonthly?)
    case daySummaryViewToMainViewEvent
    case mainViewToHourSummaryViewEvent(String?, WeatherDataHourly?)
    case hourSummaryViewToMainViewEvent
}

protocol Coordinator : AnyObject {
    var navigationController : UINavigationController? { get set }
    func processEvent(with type : CoordinatorEvent)
    func start()
    func showCoordinatorAlert()
}

enum CoordinatingViewModelTypes {
    case onboardingModel
    case mainViewModel
    case settingsViewModel
    case daySummaryViewModel(String?, WeatherDataMonthly?)
    case hourSummaryViewModel(String?, WeatherDataHourly?)
}

enum OnboardingMode {
    case withCurrentLocation
    case withoutCurrentLocation
}

extension Coordinator {
    func showCoordinatorAlert() {
        let alert = UIAlertController(title: "Unexpected Error", message: "Unexpected Coordiator Error", preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertActionOK)
        navigationController?.present(alert, animated: true)
    }
}

