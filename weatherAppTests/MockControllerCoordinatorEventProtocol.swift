//
//  MockControllerCoordinatorEventProtocol.swift
//  weatherAppTests
//
//  Created by Марк Пушкарь on 17.04.2022.
//

import Foundation
@testable import weatherApp

protocol MockControllerCoordinatorEventProtocol {
    func event(type : CoordinatorEvent)
}
