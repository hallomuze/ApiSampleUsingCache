//
//  sharedConstants.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/7/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import Foundation

enum jsonError : Error {
    case missing(String)
    case invalid(String, Any)
}

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
