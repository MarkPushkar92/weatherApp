//
//  weatherAppTests.swift
//  weatherAppTests
//
//  Created by Марк Пушкарь on 17.04.2022.
//

import XCTest
import UIKit
@testable import weatherApp

class weatherAppTests: XCTestCase {

        func testOnboardingViewIsFirst() throws {
            let navigationVC = UINavigationController()
            let viewFactory = ViewModelFactoryMock()
            let appCoordinator = AppCoordinator(viewModelFactory: viewFactory)
            appCoordinator.navigationController = navigationVC
            appCoordinator.start()
            XCTAssertEqual(viewFactory.controllers[.onboarding]?.timesAppeared, 1)
        }

        func testOnboardingToMainView() throws {
            let navigationVC = UINavigationController()

            let viewFactory = ViewModelFactoryMock()
            let appCoordinator = AppCoordinator(viewModelFactory: viewFactory)
            appCoordinator.navigationController = navigationVC
            appCoordinator.start()
            viewFactory.controllers[.onboarding]?.event(type: .onboardingViewToMainViewEvent(.withCurrentLocation))
            XCTAssertEqual(viewFactory.controllers[.onboarding]?.timesAppeared, 1)
            XCTAssertEqual(viewFactory.controllers[.main]?.timesAppeared, 1)
        }

        func testOnboardingToMainAndToSettings() throws {
            let navigationVC = UINavigationController()
            let viewFactory = ViewModelFactoryMock()
            let appCoordinator = AppCoordinator(viewModelFactory: viewFactory)
            appCoordinator.navigationController = navigationVC
            appCoordinator.start()
            viewFactory.controllers[.onboarding]?.event(type: .onboardingViewToMainViewEvent(.withCurrentLocation))
            viewFactory.controllers[.main]?.event(type: .mainViewToSettingsViewEvent)
            XCTAssertEqual(viewFactory.controllers[.onboarding]?.timesAppeared, 1)
            XCTAssertEqual(viewFactory.controllers[.main]?.timesAppeared, 1)
            XCTAssertEqual(viewFactory.controllers[.settings]?.timesAppeared, 1)
        }

    


}
