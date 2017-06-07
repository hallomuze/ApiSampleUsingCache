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
    
//    var features : [String]?
    
    var fileSizeBytes : String
//    var formattedPrice : String
//    var genreIds : [String] //   ( 6015, 6012 );
//    var genres : [String]
//
//    var ipadScreenshotUrls : [String]?
//  
//    var isGameCenterEnabled : String
//    var isVppDeviceBasedLicensingEnabled : String
//    var kind : String
//    var languageCodesISO2A:[String]  // EN.
//    var minimumOsVersion : String
//    var price : String
//    
//    
//    var primaryGenreId : Int  주의.
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
        debugPrint("app name :\(trackName)")
        
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
        
        //warning... if let 등은 바로 쓰면 crash
        
        
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



/*
 [{
 advisories =     (
 );
 appletvScreenshotUrls =     (
 );
 artistId = 446370314;
 artistName = "Viva Republica";
 artistViewUrl = "https://itunes.apple.com/kr/developer/viva-republica/id446370314?uo=4";
 artworkUrl100 = "http://is1.mzstatic.com/image/thumb/Purple117/v4/2a/df/b9/2adfb9a7-b285-783d-f58e-e6d1ef063d1b/source/100x100bb.jpg";
 artworkUrl512 = "http://is1.mzstatic.com/image/thumb/Purple117/v4/2a/df/b9/2adfb9a7-b285-783d-f58e-e6d1ef063d1b/source/512x512bb.jpg";
 artworkUrl60 = "http://is1.mzstatic.com/image/thumb/Purple117/v4/2a/df/b9/2adfb9a7-b285-783d-f58e-e6d1ef063d1b/source/60x60bb.jpg";
 averageUserRating = 4;
 averageUserRatingForCurrentVersion = 4;
 bundleId = "com.vivarepublica.cash";
 contentAdvisoryRating = "4+";
 currency = USD;
 currentVersionReleaseDate = "2017-05-22T23:11:48Z";
 description = "\Ub180\Ub77c\Uc6b4 \Uac04\Ud3b8\Ud568.\n\Uc1a1\Uae08\Uc740 \Uc774\Uc81c Toss\Uc785\Ub2c8\Ub2e4.\n\n[\Ud604\Uc7ac \Uac00\Uc785 \Uac00\Ub2a5 \Uacc4\Uc88c]\n- \Uc6b0\Ub9ac\n- KB\Uad6d\Ubbfc\n- NH\Ub18d\Ud611\n- \Uc2e0\Ud55c\n- KEB\Ud558\Ub098\Uc740\Ud589 (\Uad6c \Uc678\Ud658\Uc740\Ud589 \Ud3ec\Ud568)\n- IBK\Uae30\Uc5c5\Uc740\Ud589\n- \Uc6b0\Uccb4\Uad6d\n- \Ubd80\Uc0b0\Uc740\Ud589\n- \Uacbd\Ub0a8\Uc740\Ud589\n- \Uad11\Uc8fc\Uc740\Ud589\n- \Uc804\Ubd81\Uc740\Ud589\n- \Uc0c8\Ub9c8\Uc744\Uae08\Uace0\n- \Uc2e0\Ud611\n- SC\n- \Ub300\Uad6c\Uc740\Ud589\n- KDB\Uc0b0\Uc5c5\Uc740\Ud589\n- \Uc81c\Uc8fc\Uc740\Ud589\n- \Uc218\Ud611\n- NH\Ud22c\Uc790\Uc99d\Uad8c\n- \Ub300\Uc2e0\Uc99d\Uad8c\n- \Uc9c0\Uc6d0 \Uc740\Ud589\Uc740 \Uacc4\Uc18d \Ucd94\Uac00\Ub418\Uba70, \Uc704 \Uacc4\Uc88c\Uac00 \Uc5c6\Uc5b4\Ub3c4 Toss\Uc758 \Uc1a1\Uae08\Uc744 \Uccb4\Ud5d8\Ud574\Ubcfc \Uc218 \Uc788\Uc2b5\Ub2c8\Ub2e4.\n\n- \Uad6d\Ub0b4 \Ubaa8\Ub4e0 \Uc740\Ud589\Uacfc \Uc99d\Uad8c\Uc0ac\Uc758 \Uacc4\Uc88c\Ub85c \Ubcf4\Ub0bc \Uc218 \Uc788\Uc2b5\Ub2c8\Ub2e4.\n\n[\Ucc28\Uc6d0\Uc774 \Ub2e4\Ub978 \Uac04\Ud3b8\Ud568]\n- \Ubcf4\Ub0bc \Uae08\Uc561, \Ubc1b\Ub294 \Uc0ac\Ub78c, \Uc554\Ud638\Ub9cc \Uc785\Ub825\Ud558\Uba74 \Uc1a1\Uae08 \Uc644\Ub8cc!\n- \Uc774\Uc81c \Ub354 \Uc774\Uc0c1 \Uc1a1\Uae08\Uc744 \Uc704\Ud574 \Uacf5\Uc778\Uc778\Uc99d\Uc11c, \Ubcf4\Uc548\Uce74\Ub4dc, ActiveX\Uc640 \Uc528\Ub984\Ud560 \Ud544\Uc694\Uac00 \Uc5c6\Uc2b5\Ub2c8\Ub2e4.\n\n[\Uacc4\Uc88c\Ubc88\Ud638\Ub97c \Ubaa8\Ub974\Uc2dc\Ub098\Uc694? \Uc5f0\Ub77d\Ucc98\Ub85c \Uc1a1\Uae08\Ud558\Uc138\Uc694!]\n- \Ubc1b\Ub294 \Uc0ac\Ub78c\Uc758 \Uc804\Ud654\Ubc88\Ud638\Ub9cc \Uc120\Ud0dd\Ud558\Uba74 \Ubb38\Uc790 \Uba54\Uc2dc\Uc9c0\Ub97c \Ud1b5\Ud574 \Uc1a1\Uae08 \Uc644\Ub8cc!\n\n[\Uacc4\Uc88c\Ubc88\Ud638\Ub294 \Uc544\Ub294\Ub370 \Uc785\Ub825\Ud558\Uae30\Uac00 \Uadc0\Ucc2e\Uc73c\Uc2e0\Uac00\Uc694? 1\Ucd08\Uba74 \Ub429\Ub2c8\Ub2e4]\n- \Uacc4\Uc88c \Uc815\Ubcf4\Uac00 \Ud3ec\Ud568\Ub41c \Uba54\Uc2dc\Uc9c0\Ub97c \Ud1b5\Uc9f8\Ub85c \Ubcf5\Uc0ac\Ud558\Uba74,\n- Toss\Uac00 \Uacc4\Uc88c \Uc815\Ubcf4\Ub9cc \Uac78\Ub7ec\Ub0b4\Uc5b4 \Uc790\Ub3d9\Uc73c\Ub85c \Uc785\Ub825\Ud574\Ub4dc\Ub9bd\Ub2c8\Ub2e4.\n\n[\Ubc1b\Ub294 \Uc0ac\Ub78c\Uc740 Toss \Uc571 \Uc124\Uce58\Uac00 \Ud544\Uc694 \Uc5c6\Uc2b5\Ub2c8\Ub2e4]\n- \Uc571 \Uc124\Uce58 \Uc5c6\Uc774\Ub3c4 \Ubc1b\Ub294 \Uc0ac\Ub78c\Uc758 \Uacc4\Uc88c\Ub85c '\Uc989\Uc2dc' \Uc785\Uae08\Ub429\Ub2c8\Ub2e4.\n\n[\Ubb38\Uc758]\n- \Uce74\Uce74\Uc624\Ud1a1 > \Uce5c\Uad6c\Ucc3e\Uae30 > \Uc544\Uc774\Ub514 \Uac80\Uc0c9 > '@toss' \Ucc3e\Uae30 \n- 1599-4905";
 features =     (
 );
 fileSizeBytes = 64572416;
 formattedPrice = "\Ubb34\Ub8cc";
 genreIds =     (
 6015,
 6012
 );
 genres =     (
 "\Uae08\Uc735",
 "\Ub77c\Uc774\Ud504 \Uc2a4\Ud0c0\Uc77c"
 );
 ipadScreenshotUrls =     (
 );
 isGameCenterEnabled = 0;
 isVppDeviceBasedLicensingEnabled = 1;
 kind = software;
 languageCodesISO2A =     (
 EN
 );
 minimumOsVersion = "8.0";
 price = 0;
 primaryGenreId = 6015;
 primaryGenreName = Finance;
 releaseDate = "2014-03-27T23:55:28Z";
 releaseNotes = "- \Uc11c\Ube44\Uc2a4 \Ud0ed \Ud654\Uba74 \Uac1c\Uc120: Toss \Uc5d0\Uc11c \Uc81c\Uacf5\Ud558\Ub294 \Uc11c\Ube44\Uc2a4\Ub4e4\Uc744 \Ud55c \Ub208\Uc5d0 \Ubcfc \Uc218 \Uc788\Ub3c4\Ub85d \Uac1c\Uc120\Ud558\Uc600\Uc2b5\Ub2c8\Ub2e4. \Uc55e\Uc73c\Ub85c \Ucd94\Uac00\Ub420 \Uc11c\Ube44\Uc2a4 \Uae30\Ub300\Ud574\Uc8fc\Uc138\Uc694~\n\n- \Uae30\Ud0c0 \Ubc84\Uadf8 \Ubc0f \Uc0ac\Uc6a9\Uc131 \Uac1c\Uc120 \n\n* Toss\Uac00 \Ub9d8\Uc5d0 \Ub4dc\Uc168\Ub098\Uc694? 1\Ubd84\Ub9cc \Uc2dc\Uac04\Ub0b4\Uc5b4 \Ub9ac\Ubdf0\Ub97c \Ub0a8\Uaca8\Uc8fc\Uc138\Uc694. \Uc5ec\Ub7ec\Ubd84\Uc758 \Ub9ac\Ubdf0\Ub294 \Uc800\Ud76c\Uac00 Toss\Ub97c \Ubc1c\Uc804\Uc2dc\Ud0a4\Ub294\Ub370 \Uc88b\Uc740 \Ubc11\Uac70\Ub984\Uc774 \Ub429\Ub2c8\Ub2e4. (Tip: \Ub9ac\Ubdf0\Ub294 \Ubc84\Uc804\Ub9c8\Ub2e4 \Ub0a8\Uae38 \Uc218 \Uc788\Uc2b5\Ub2c8\Ub2e4.)\n\n* Toss \Uc0ac\Uc6a9\Uc5d0 \Ubb38\Uc81c\Ub97c \Uacaa\Uace0 \Uacc4\Uc2e0\Uac00\Uc694? \Uc571 \Ub0b4\Uc758 \Uace0\Uac1d\Uc13c\Ud130\Ub97c \Ud1b5\Ud574 \Uc5b8\Uc81c\Ub4e0 \Uc54c\Ub824\Uc8fc\Uc138\Uc694. \Uc5ec\Ub7ec\Ubd84\Uc758 \Uc5b4\Ub824\Uc6c0\Uc744 \Uc2e0\Uc18d\Ud788 \Ud574\Uacb0\Ud574 \Ub4dc\Ub9ac\Ub3c4\Ub85d \Ud558\Uaca0\Uc2b5\Ub2c8\Ub2e4.";
 screenshotUrls =     (
 "http://a1.mzstatic.com/us/r30/Purple111/v4/1c/7e/4f/1c7e4f48-4474-cfdc-bc43-cf1a5190b122/screen696x696.jpeg",
 "http://a5.mzstatic.com/us/r30/Purple111/v4/db/d7/c5/dbd7c571-2cc9-cae7-ac2c-237b24b1a3e5/screen696x696.jpeg",
 "http://a2.mzstatic.com/us/r30/Purple122/v4/e5/ea/49/e5ea4971-1a5a-79f4-f635-16d136c6c5e4/screen696x696.jpeg",
 "http://a2.mzstatic.com/us/r30/Purple111/v4/5d/56/28/5d562802-66ac-2b61-4a91-a59b9d7d1519/screen696x696.jpeg",
 "http://a2.mzstatic.com/us/r30/Purple111/v4/e1/39/16/e13916b3-06a7-9ce6-a9da-b7c222d7103f/screen696x696.jpeg"
 );
 sellerName = "Viva Republica";
 sellerUrl = "https://toss.im";
 supportedDevices =     (
 "iPad2Wifi-iPad2Wifi",
 "iPad23G-iPad23G",
 "iPhone4S-iPhone4S",
 "iPadThirdGen-iPadThirdGen",
 "iPadThirdGen4G-iPadThirdGen4G",
 "iPhone5-iPhone5",
 "iPodTouchFifthGen-iPodTouchFifthGen",
 "iPadFourthGen-iPadFourthGen",
 "iPadFourthGen4G-iPadFourthGen4G",
 "iPadMini-iPadMini",
 "iPadMini4G-iPadMini4G",
 "iPhone5c-iPhone5c",
 "iPhone5s-iPhone5s",
 "iPadAir-iPadAir",
 "iPadAirCellular-iPadAirCellular",
 "iPadMiniRetina-iPadMiniRetina",
 "iPadMiniRetinaCellular-iPadMiniRetinaCellular",
 "iPhone6-iPhone6",
 "iPhone6Plus-iPhone6Plus",
 "iPadAir2-iPadAir2",
 "iPadAir2Cellular-iPadAir2Cellular",
 "iPadMini3-iPadMini3",
 "iPadMini3Cellular-iPadMini3Cellular",
 "iPodTouchSixthGen-iPodTouchSixthGen",
 "iPhone6s-iPhone6s",
 "iPhone6sPlus-iPhone6sPlus",
 "iPadMini4-iPadMini4",
 "iPadMini4Cellular-iPadMini4Cellular",
 "iPadPro-iPadPro",
 "iPadProCellular-iPadProCellular",
 "iPadPro97-iPadPro97",
 "iPadPro97Cellular-iPadPro97Cellular",
 "iPhoneSE-iPhoneSE",
 "iPhone7-iPhone7",
 "iPhone7Plus-iPhone7Plus",
 "iPad611-iPad611",
 "iPad612-iPad612"
 );
 trackCensoredName = "Toss \Ud1a0\Uc2a4 : \Uc1a1\Uae08\Uc774 \Uc26c\Uc6cc\Uc9c4\Ub2e4";
 trackContentRating = "4+";
 trackId = 839333328;
 trackName = "Toss \Ud1a0\Uc2a4 : \Uc1a1\Uae08\Uc774 \Uc26c\Uc6cc\Uc9c4\Ub2e4";
 trackViewUrl = "https://itunes.apple.com/kr/app/toss-%ED%86%A0%EC%8A%A4-%EC%86%A1%EA%B8%88%EC%9D%B4-%EC%89%AC%EC%9B%8C%EC%A7%84%EB%8B%A4/id839333328?mt=8&uo=4";
 userRatingCount = 6932;
 userRatingCountForCurrentVersion = 105;
 version = "2.16.1";
 wrapperType = software;
 }]
 
 */
