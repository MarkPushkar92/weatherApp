//
//  MockDaySummaryController.swift
//  weatherAppTests
//
//  Created by Марк Пушкарь on 17.04.2022.
//

import Foundation
import UIKit

@testable import weatherApp

class MockDaySummaryViewController : UIViewController,
                                     Coordinating,
                                     ControllerStatisticsProtocol,
                                     MockControllerCoordinatorEventProtocol {
    func event(type: CoordinatorEvent) {
        coordinator?.processEvent(with: type)
    }

    var coordinator: Coordinator?
    
    var timesAppeared: Int {
        get {
            return appearedCounter
        }
    }
        
    private var appearedCounter : Int = 0

    override func viewDidLoad() {
        appearedCounter += 1
    }
}
