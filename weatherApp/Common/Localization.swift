//
//  Localization.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 15.05.2022.
//

import Foundation

class Localization {
    
    static func localizedString(key: String) -> String {
        print("Делаем локализацию \(key)")
        guard let locPath = Bundle(for: Localization.self).path(forResource: "ru", ofType: "lproj") else {
            return ""
        }
        guard let locBundle = Bundle(path: locPath) else {
            return ""
        }
        let result = NSLocalizedString(key, bundle: locBundle, comment: "")
        return result
    }
    
}



