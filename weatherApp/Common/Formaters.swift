//
//  Formaters.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 19.02.2022.
//

import Foundation

class UIDateDateFormatter {
    public static func convertDateToGraphRepresentation(_ date : Date,
                                                        locale : Locale = Locale(identifier: "ru_RU"),
                                                        dateFormat : String = "HH:00") -> String
    {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.locale = locale
        dayTimePeriodFormatter.dateFormat = dateFormat
        return dayTimePeriodFormatter.string(from: date)
    }

    public static func formatTimeOfDay(date : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "ru_RU")
        timeFormatter.dateFormat = "HH:mm"
        
        return timeFormatter.string(from: date)
    }

    public static func formatTimeOfDay12Format(date : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "ru_RU")
        timeFormatter.dateFormat = "hh:mm a"
        
        return timeFormatter.string(from: date)
    }

    public static func formatForCalendarDate(date : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM"
        timeFormatter.locale = Locale(identifier: "ru_RU")
        return timeFormatter.string(from: date)
    }

    public static func formatForCalendarDateWithDay(date : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM E"
        timeFormatter.locale = Locale(identifier: "ru_RU")
        return timeFormatter.string(from: date)
    }

    public static func formatDayTimePeriod(date : Date) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.locale = Locale(identifier: "ru_RU")
        dayTimePeriodFormatter.dateFormat = "HH:mm, EE dd MMMM"
        return dayTimePeriodFormatter.string(from: date)
    }
    
    public static func formatDayTimePeriod12Format(date : Date) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.locale = Locale(identifier: "ru_RU")
        dayTimePeriodFormatter.dateFormat = "hh:mm a, EE dd MMMM"
        return dayTimePeriodFormatter.string(from: date)
    }

}

class KmToMlConverter {
    
    public static func toMl(km : Float) -> Float {
        return 0.6214*km
    }
    
    public static func toKm(ml : Float) -> Float {
        return 1.6093*ml
    }
}

class CelciusToFahrConverter {
    
    public static func toCelcius(fh : Float) -> Float {
        return (fh - 32)/1.8
    }
    
    public static func toFahr(cel : Float) -> Float {
        return cel*1.8 + 32
    }
}
