//
//  CommonThingsAndHelpers.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 05.02.2022.
//

import Foundation
import UIKit
import CoreLocation

typealias UiViewClickHandler = () -> Void

// Class Below is used to fill diffrerent views with subViews on the main screen

class ViewFiller {
    
    public static func fillAreaWithView(area : UIView, filler : UIView) {
        area.addSubview(filler)
    
        let constraints = [
            filler.trailingAnchor.constraint(equalTo: area.trailingAnchor),
            filler.leadingAnchor.constraint(equalTo: area.leadingAnchor),
            filler.topAnchor.constraint(equalTo: area.topAnchor),
            filler.bottomAnchor.constraint(equalTo: area.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

// GeoTracking Helpers

typealias LocationUpdateHandler = (CLLocation) -> Void

struct GeoPosition {
    let latitude : Float
    let longitude : Float
}
