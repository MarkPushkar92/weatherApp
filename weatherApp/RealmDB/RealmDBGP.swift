//
//  RealmDBGP.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 11.02.2022.
//

// Completed File


import Foundation
import RealmSwift

@objcMembers class DbGeoPointCached: Object {
    dynamic var id: String = ""
    dynamic var latitude: Float = 0.0
    dynamic var longitude: Float = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class DbGeoPoint {
    let id: String
    let latitude: Float
    let longitude: Float
    
    init(id: String, latitude: Float, longitude: Float) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
}

class GeoPointsDbProvider {
    private var realm: Realm?
    
    init() {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent(AppCommonStrings.appRealmDbName)
        realm = try? Realm(configuration: config)
    }
    
    func getGeoPointAmount() -> Int {
        return realm?.objects(DbGeoPointCached.self).count ?? 0
    }
    
    func getGeoPoints() -> [DbGeoPoint] {
        if let geoPoints = realm?.objects(DbGeoPointCached.self) {
            return geoPoints.compactMap { cachedItem in
                return DbGeoPoint(id: cachedItem.id,
                                  latitude: cachedItem.latitude ,
                                  longitude: cachedItem.longitude )
            }
        } else {
            return []
        }
    }
    
    func getGeoPoint(id : String) -> DbGeoPoint? {
        let geoPoints = realm?.object(ofType: DbGeoPointCached.self, forPrimaryKey: id)
        if let geoPoints = geoPoints {
            let ret = DbGeoPoint(id: geoPoints.id,
                                 latitude: geoPoints.latitude ,
                                 longitude: geoPoints.longitude )
            
            print("getGeoPoint \(ret.latitude), \(ret.longitude)")
            
            return ret
        } else {
            return nil
        }
    }
    
    func addGeoPoint(geoPoint: DbGeoPoint) {
        let cachedGeoPoint = DbGeoPointCached()
        cachedGeoPoint.id = geoPoint.id
        cachedGeoPoint.latitude = geoPoint.latitude
        cachedGeoPoint.longitude = geoPoint.longitude

        if isGeoPointExist(id: geoPoint.id) {
            try? realm?.write {
               realm?.add(cachedGeoPoint, update: .modified)
               // realm?.add(cachedGeoPoint, update: .all)
            }
        } else {
            try? realm?.write {
                realm?.add(cachedGeoPoint)
                print("addGeoPoint \(cachedGeoPoint.latitude), \(cachedGeoPoint.longitude)")
            }
        }
    }
        
    func isGeoPointExist(id: String) -> Bool {
        return realm?.object(ofType: DbGeoPointCached.self, forPrimaryKey: id) != nil
    }
}

class GeoPointsDB {
    private let dbDataProvider : GeoPointsDbProvider = GeoPointsDbProvider()
    
    static var shared: GeoPointsDB = {
        let instance = GeoPointsDB()
        return instance
    }()

    private init() {}
    
    func getGeoPointAmount() -> Int {
        return dbDataProvider.getGeoPointAmount()
    }
    
    func getGeoPoint(id : String) -> DbGeoPoint? {
        return dbDataProvider.getGeoPoint(id: id)
    }
    
    func addGeoPoint(geoPoint: DbGeoPoint) {
        dbDataProvider.addGeoPoint(geoPoint: geoPoint)
    }
        
    func getGeoPoints() -> [DbGeoPoint] {
        return dbDataProvider.getGeoPoints()
    }
}

