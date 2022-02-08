//
//  DetailedDayView.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 08.02.2022.
//

import Foundation
import UIKit

// completed view

class DetailedDayView : UIView {
    
    //MARK: PROPERTIES
    
    public var dayDetailsHandler : UiViewClickHandler?
    
    @objc private func clickHandler() {
        dayDetailsHandler?()
    }
    
    private lazy var gotoDetails : UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Подробнее на 24 часа", attributes: underlineAttribute)
        view.attributedText = underlineAttributedString
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        
        let clickEvent = UITapGestureRecognizer()
        clickEvent.addTarget(self, action: #selector(clickHandler))
        
        view.addGestureRecognizer(clickEvent)
        return view
    }()
    
    //MARK: layout SetUp
    
    private func setupViews() {
        self.addSubview(gotoDetails)
        let constraints = [
            gotoDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            gotoDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: INIT
    
    init(viewFrame : CGRect) {
        super.init(frame: viewFrame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented for GoToDetailed24View")
    }
}
