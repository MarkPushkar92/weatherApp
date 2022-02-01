//
//  ViewController.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 01.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let onBoardingView = OnBoardingView(viewFrame: self.view.frame)
        view = onBoardingView
    }


}

