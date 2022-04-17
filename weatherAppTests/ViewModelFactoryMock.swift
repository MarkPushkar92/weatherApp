//
//  ViewControllerFactoryMock.swift
//  weatherAppTests
//
//  Created by Марк Пушкарь on 17.04.2022.
//

import Foundation
import UIKit
@testable import weatherApp

class ViewModelFactoryMock : ViewModelFactory {

    var controllers : [Screen : ControllerStatisticsProtocol & MockControllerCoordinatorEventProtocol] = [:]

    func createViewController(with type: CoordinatingViewModelTypes, coordinator: Coordinator) -> UIViewController & Coordinating {

        var viewController : UIViewController &
                            Coordinating &
                            ControllerStatisticsProtocol &
                            MockControllerCoordinatorEventProtocol

        switch type {
            case .onboardingModel :
                viewController = MockOnboardingViewController()
                controllers[.onboarding] = viewController

            case .mainViewModel :
                viewController = MockMainViewController()
                controllers[.main] = viewController

            case .daySummaryViewModel :
                viewController = MockDaySummaryViewController()
                controllers[.daySummary] = viewController

            case .hourSummaryViewModel :
                viewController = MockHourSummaryViewController()
                controllers[.hourSummary] = viewController

            case .settingsViewModel :
                viewController = MockSettingsViewController()
                controllers[.settings] = viewController
        }

        viewController.coordinator = coordinator

        let _ = viewController.view

        return viewController
    }
}
