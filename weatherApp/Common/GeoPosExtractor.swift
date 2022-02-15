//
//  GeoPosExtractor.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 15.02.2022.
//

import Foundation
import CoreLocation

class GeoPositionExtractor {
    static func extract(from : String) -> GeoPosition? {
        let components = from.components(separatedBy: [" "]).compactMap { str in Float(str) }

        if components.count != 2 {
            return nil
        } else {
            return GeoPosition(latitude: components[1], longitude: components[0])
        }
    }
}
