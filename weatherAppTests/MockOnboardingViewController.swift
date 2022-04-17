//
//  MockOnboardingViewController.swift
//  weatherAppTests
//
//  Created by Марк Пушкарь on 17.04.2022.
//

import Foundation
import UIKit

@testable import weatherApp

class MockOnboardingViewController : UIViewController,
                                     Coordinating,
                                     ControllerStatisticsProtocol,
                                     MockControllerCoordinatorEventProtocol {
    
    func event(type: CoordinatorEvent) {
        coordinator?.processEvent(with: type)
    }
    
    var timesAppeared: Int {
        get {
            return appearedCounter
        }
    }
        
    private var appearedCounter : Int = 0
    
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        appearedCounter += 1
    }
    
}

