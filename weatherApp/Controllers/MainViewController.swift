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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let onBoardingView = MainScreenView(viewFrame: self.view.frame)
        view = onBoardingView
    }

}
