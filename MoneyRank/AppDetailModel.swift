//
//  AppDetailModel.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/6/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

let artistId_suffix : String = "artistId"
let artistName_suffix  : String = "artistName"
let artistViewUrl_suffix : String = "artistViewUrl"
let artworkUrl100_suffix  : String = "artworkUrl100"
let artworkUrl512_suffix  : String = "artworkUrl512"
let artworkUrl60_suffix  : String = "artworkUrl60"
let averageUserRating_suffix  : String = "averageUserRating"
let averageUserRatingForCurrentVersion_suffix : String = "averageUserRatingForCurrentVersion"
let bundleId_suffix  : String = "bundleId"
let contentAdvisoryRating_suffix : String = "contentAdvisoryRating"
let currency_suffix  : String = "currency"
let currentVersionReleaseDate_suffix  : String = "currentVersionReleaseDate"
let description_suffix: String = "description"

let features_suffix = "features"

let fileSizeBytes_suffix : String = "fileSizeBytes"
let formattedPrice_suffix : String = "formattedPrice"
let genreIds_suffix :String = "genreIds"//   ( 6015, 6012 );
let genres_suffix : String = "genres"

let ipadScreenshotUrls_suffix = "ipadScreenshotUrls"

let isGameCenterEnabled_suffix = "isGameCenterEnabled"
let isVppDeviceBasedLicensingEnabled_suffix = "isVppDeviceBasedLicensingEnabled"
let kind_suffix : String = "kind"
let languageCodesISO2A_suffix  = "languageCodesISO2A" // EN.
let minimumOsVersion_suffix : String = "minimumOsVersion"
let price_suffix : String = "price"
let primaryGenreId_suffix : String = "primaryGenreId"
let primaryGenreName_suffix  : String = "primaryGenreName"
let releaseDate_suffix : String = "releaseDate"
let releaseNotes_suffix : String = "releaseNotes"

let screenshotUrls_suffix = "screenshotUrls"
let sellerName_suffix : String = "sellerName"
let sellerUrl_suffix : String = "sellerUrl"
let supportedDevices_suffix = "supportedDevices"
let trackCensoredName_suffix : String = "trackCensoredName"
let trackContentRating_suffix : String = "trackContentRating"
let trackId_suffix : String = "trackId"
let trackName_suffix : String = "trackName"
let trackViewUrl_suffix : String = "trackViewUrl"
let userRatingCount_suffix : String = "userRatingCount"
let userRatingCountForCurrentVersion_suffix : String = "userRatingCountForCurrentVersion"
let version_suffix : String = "version"
let wrapperType_suffix : String = "wrapperType"

struct AppDetailModel    {

    var artistId : Int
    var artistName  : String
    var artistViewUrl : String
    var artworkUrl100  : String
    var artworkUrl512  : String
    var artworkUrl60  : String
    var averageUserRating  : Int?
    var averageUserRatingForCurrentVersion : Int?
    var bundleId  : String
    var contentAdvisoryRating : String
    var currency  : String
    var currentVersionReleaseDate  : String
    var description: String
    
    var fileSizeBytes : String
    var languageCodesISO2A:[String]?  // EN.

    var primaryGenreName  : String
    var releaseDate : String
    var releaseNotes : String
    var screenshotUrls : [String]
    var sellerName : String
    var sellerUrl : String?
    var supportedDevices : [String]
    var trackCensoredName : String
    var trackContentRating : String
    var trackId : Int
    var trackName : String
    var trackViewUrl : String
    var userRatingCount : Int
    var userRatingCountForCurrentVersion : Int?
    var version : String
    var wrapperType : String
    
    
    
}

enum jsonError : Error {
    case missing(String)
    case invalid(String, Any)
}

extension AppDetailModel {
    
    init(json: [String:Any] ) throws {
        
        guard let artistId = json[artistId_suffix] as? Int else {
            throw jsonError.missing(artistId_suffix)
        }
        self.artistId = artistId
        
        guard let artistName = json[artistName_suffix] as? String else {
            throw jsonError.missing(artistName_suffix)
        }
        self.artistName = artistName
        guard let artistViewUrl = json[artistViewUrl_suffix] as? String else {
            throw jsonError.missing(artistId_suffix)
        }
        self.artistViewUrl = artistViewUrl
        guard let artworkUrl100 = json[artworkUrl100_suffix] as? String else {
            throw jsonError.missing(artistId_suffix)
        }
        self.artworkUrl100 = artworkUrl100
        guard let artworkUrl512 = json[artworkUrl512_suffix] as? String else {
            throw jsonError.missing(artistId_suffix)
        }
        self.artworkUrl512 = artworkUrl512
        guard let artworkUrl60 = json[artworkUrl60_suffix] as? String else {
            throw jsonError.missing(artworkUrl60_suffix)
        }
        self.artworkUrl60 = artworkUrl60
        guard let averageUserRating = json[averageUserRating_suffix] as? Int else {
            throw jsonError.missing(averageUserRating_suffix)
        }
        self.averageUserRating = averageUserRating
        
        
        if let averageUserRatingForCurrentVersion = json[averageUserRatingForCurrentVersion_suffix] as? Int  {
            self.averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion
        }
        
        
        guard let bundleId = json[bundleId_suffix] as? String else {
            throw jsonError.missing(bundleId_suffix)
        }
        self.bundleId = bundleId
        guard let contentAdvisoryRating = json[contentAdvisoryRating_suffix] as? String else {
            throw jsonError.missing(contentAdvisoryRating_suffix)
        }
        self.contentAdvisoryRating = contentAdvisoryRating
        guard let currentVersionReleaseDate = json[currentVersionReleaseDate_suffix] as? String else {
            throw jsonError.missing(currentVersionReleaseDate_suffix)
        }
        self.currentVersionReleaseDate = currentVersionReleaseDate
        guard let currency = json[currency_suffix] as? String else {
            throw jsonError.missing(currency_suffix)
        }
        self.currency = currency
        guard let description = json[description_suffix] as? String else {
            throw jsonError.missing(description_suffix)
        }
        self.description = description
        
        guard let fileSizeBytes = json[fileSizeBytes_suffix] as? String else {
            throw jsonError.missing(fileSizeBytes_suffix)
        }
        self.fileSizeBytes = fileSizeBytes
        
        if let languageCodesISO2A = json[languageCodesISO2A_suffix] as? [String]   {
            self.languageCodesISO2A = languageCodesISO2A
        }
        
        
        
        guard let primaryGenreName = json[primaryGenreName_suffix] as? String else {
            throw jsonError.missing(primaryGenreName_suffix)
        }
        self.primaryGenreName = primaryGenreName
        guard let releaseDate = json[releaseDate_suffix] as? String else {
            throw jsonError.missing(releaseDate_suffix)
        }
        self.releaseDate = releaseDate
        guard let releaseNotes = json[releaseNotes_suffix] as? String else {
            throw jsonError.missing(releaseNotes_suffix)
        }
        self.releaseNotes = releaseNotes
        guard let screenshotUrls = json[screenshotUrls_suffix] as? [String] else {
            throw jsonError.missing(screenshotUrls_suffix)
        }
        
        self.screenshotUrls = screenshotUrls
        guard let sellerName = json[sellerName_suffix] as? String else {
            throw jsonError.missing(sellerName_suffix)
        }
        self.sellerName = sellerName
        
        
        if let sellerUrl = json[sellerUrl_suffix] as? String {   //optional parameter.
            self.sellerUrl = sellerUrl
        }
        
        
        guard let supportedDevices = json[supportedDevices_suffix] as? [String] else {
            throw jsonError.missing(supportedDevices_suffix)
        }
        self.supportedDevices = supportedDevices
        
        guard let trackCensoredName = json[trackCensoredName_suffix] as? String else {
            throw jsonError.missing(trackCensoredName_suffix)
        }
        self.trackCensoredName = trackCensoredName
        
        guard let trackContentRating = json[trackContentRating_suffix] as? String else {
            throw jsonError.missing(trackContentRating_suffix)
        }
        self.trackContentRating = trackContentRating
        
        guard let trackId = json[trackId_suffix] as? Int else {
            throw jsonError.missing(trackId_suffix)
        }
        self.trackId = trackId
        
        guard let trackName = json[trackName_suffix] as? String else {
            throw jsonError.missing(trackName_suffix)
        }
        self.trackName = trackName

        
        guard let trackViewUrl = json[trackViewUrl_suffix] as? String else {
            throw jsonError.missing(trackViewUrl_suffix)
        }
        self.trackViewUrl = trackViewUrl
        
        
        guard let userRatingCount = json[userRatingCount_suffix] as? Int else {
            throw jsonError.missing(userRatingCount_suffix)
        }
        self.userRatingCount = userRatingCount
        
        
        if let userRatingCountForCurrentVersion = json[userRatingCountForCurrentVersion_suffix] as? Int   {
          
            self.userRatingCountForCurrentVersion = userRatingCountForCurrentVersion
        }
        
        
        guard let version = json[version_suffix] as? String else {
            throw jsonError.missing(version_suffix)
        }
        self.version = version
        
        
        guard let wrapperType = json[wrapperType_suffix] as? String else {
            throw jsonError.missing(wrapperType_suffix)
        }
        self.wrapperType = wrapperType
    }
}


