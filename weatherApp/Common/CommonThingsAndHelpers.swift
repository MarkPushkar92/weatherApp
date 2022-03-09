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
typealias UiUpdateWithWeatherDataRequestHandler = (String) -> Void
typealias UiSelectedDayChangedHandler = (Int) -> Void

typealias OneDayWeatherDataHandler = (WeatherDataOneDay?) -> ()
typealias HourlyWeatherDataHandler = (WeatherDataHourly?) -> ()
typealias MonthlyWeatherDataHandler = (WeatherDataMonthly?) -> ()

//MARK: Class Below is used to fill diffrerent views with subViews on the main screen

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

//MARK: GeoTracking Helpers

typealias LocationUpdateHandler = (CLLocation) -> Void

struct GeoPosition {
    let latitude : Float
    let longitude : Float
}

//MARK: Application Strings
enum AppCommonStrings {
    static let appName : String = "Weather App"
    static let currentLocationLabel : String = "Текущее"
    static let appRealmDbName = "weather_app_cache.realm"
}

//MARK: UserDefaultsSettingsKeys

enum UserDefaultsSettingsKeys {
    static let temperatureSettings : String = "temperatureInCelsiusOrFahrenheit"
    static let windSpeedSettings : String = "windSpeedInMiOrKm"
    static let timeFormatSettings : String = "12HourOr24HourFormat"
    static let notificationSettings : String = "notificationsAreOnOrOff"
}
