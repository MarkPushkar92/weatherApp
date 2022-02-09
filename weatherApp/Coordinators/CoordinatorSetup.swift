//
//  CoordinatorSetup.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 09.02.2022.
//

import Foundation
import UIKit

protocol Coordinating : AnyObject {
    var coordinator : Coordinator? { get set }
}

enum CoordinatorEvent {
    case onboardingViewToMainViewEvent(OnboardingMode)
    case mainViewToSettingsViewEvent
//    case settingsViewToMainViewEvent
//    case mainViewToDaySummaryViewEvent
//    case daySummaryViewToMainViewEvent
//    case mainViewToHourSummaryViewEvent
//    case hourSummaryViewToMainViewEvent
}

enum OnboardingMode {
    case withCurrentLocation
    case withoutCurrentLocation
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
//    case settingsViewModel
//    case daySummaryViewModel
//    case hourSummaryViewModel
}

extension Coordinator {
    
    func showCoordinatorAlert() {
        let alert = UIAlertController(title: "Unexpected Error", message: "Unexpected Coordiator Error", preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertActionOK)
        navigationController?.present(alert, animated: true)
    }
}

