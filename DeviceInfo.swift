//
//  getDeviceInfo.swift
//  testInternal
//
//  Created by Total Solution on 07/10/22.
//
import UIKit
import Foundation
import GameKit


public class DeviceInfo {
    public init() {}
    public func getDeviceuuid()->(Any){
        let udid = UIDevice.current.identifierForVendor?.uuidString
        let uuid2:String = (udid?.replacingOccurrences(of: "Optional(\"", with: ""))!
        let uuid3:String = uuid2.replacingOccurrences(of: "\"", with: "")
        return uuid3
    }
    public func getCountry()->(Any){
        let countrystr = Locale.current.regionCode
        let countrystr1:String = (countrystr?.replacingOccurrences(of: "Optional(\"", with: ""))!
        let country:String = countrystr1.replacingOccurrences(of: "\"", with: "")
        return country
    }
    public func getLanguage()->(Any){
        let langStr = Locale.current.languageCode
        let langStr1:String = (langStr?.replacingOccurrences(of: "Optional(\"", with: ""))!
        let language:String = langStr1.replacingOccurrences(of: "\"", with: "")
        return language
    }
   
    public func getAppName()->(Any){
        let appname1 = Bundle.main.infoDictionary?["CFBundleName"] as? String
        let appname2:String = (appname1?.replacingOccurrences(of: "Optional(\"", with: ""))!
        let appname:String = appname2.replacingOccurrences(of: "\"", with: "")
         return appname
    }
    public func getidentifier()->(Any){
        let identifier = "\(getAppName())_\(SdkConstants.DEVICE_PREFIX)\(getImei())\(SdkConstants.DEVICE_POSTFIX)"
        return identifier
    }
    public func getImei()->(Any){
      //  print("Random Number = ", generateIMEI() )
        let imei = generateIMEI()//"1826314667992232"
        return imei
    }
    public func getDeviceId()->(Any){
      //  print("Random Number = ", generateIMEI() )
        let imei = "\(SdkConstants.DEVICE_PREFIX)\(getDeviceuuid())\(SdkConstants.DEVICE_POSTFIX)"//"1826314667992232"
        return imei
    }
    public func getDeviceName()->(Any){
        let name = UIDevice.current.name
        return name
    }
    public func getDeviceVersion()->(Any){
        let version = UIDevice.current.systemVersion
        return version
    }
    public func getDeviceModelName()->(Any){
        let modelName = UIDevice.current.model
        return modelName
    }
    public func getPlatform()->(Any){
        let result = "\(SdkConstants.APP_PLATFORM)"
        return result
    }
    func generateIMEI() -> Any {
        let imei = getDeviceuuid()
       // let deviceid2:String = (deviceid1 as AnyObject).replacingOccurrences(of: "-", with: "")
       // let deviceid:String = String(deviceid2.prefix(16)) // Hello
        return imei
    }
    func getAppVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let versionValue = dictionary["CFBundleShortVersionString"] ?? "0"
        let buildValue = dictionary["CFBundleVersion"] ?? "0"
        return "\(versionValue) (build \(buildValue))"
    }
    func getSessionId() -> String {
        let result = NSUUID().uuidString
        return result
    }
    
    func getDate() -> Any {
        let date = Date()
        let dateFormatterGet = DateFormatter()
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        df.timeZone = NSTimeZone(abbreviation: "IST") as TimeZone?

        let dateString = df.string(from: date)
        return dateString

    }
    
    func getInteractionId() -> String {
        let result = NSUUID().uuidString
        return result
    }
    func getSrNumber() -> String {
        let result = NSUUID().uuidString
        return result
    }
    func getScreenSize() -> Any {
        //Screen Size
           let scale = UIScreen.main.scale

           let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163);

           let width = UIScreen.main.bounds.size.width * scale
           let height = UIScreen.main.bounds.size.height * scale

           let horizontal = width / ppi, vertical = height / ppi;

           let diagonal = sqrt(pow(horizontal, 2) + pow(vertical, 2))
           let screenSize = String(format: "%0.1f", diagonal)
           return screenSize
    }
    
    
    //Get All info
    public func getDeviceInfo()-> [String:Any] {
        
           let udid = UIDevice.current.identifierForVendor?.uuidString
           let name = UIDevice.current.name
           let version = UIDevice.current.systemVersion
           let modelName = UIDevice.current.model
        let model = UIDevice.current.model
           let langStr = Locale.current.languageCode
           let country = Locale.current.regionCode
          print("country: \(country)")
        //let state = Locale.current.
        //Screen Size
            let scale = UIScreen.main.scale

            let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163);

            let width = UIScreen.main.bounds.size.width * scale
            let height = UIScreen.main.bounds.size.height * scale

            let horizontal = width / ppi, vertical = height / ppi;

            let diagonal = sqrt(pow(horizontal, 2) + pow(vertical, 2))
            let screenSize = String(format: "%0.1f", diagonal)
           // print("Screen Size = \(screenSize)")
//           print(udid ?? "")    // D774EAE3F447445F9D5FE2B3B699ADB1
//           print(name)          // iPhone XR
//           print(version)       // 12.1
//           print(modelName)     // iPhone
        
       // let jsonObject: [String: Any] = [
        let jsonObject:[String : Any] = [
            "name": name,
            "udid": udid,
            "version": version,
            "modelName": modelName,
            "model": modelName,
            "Screen":screenSize,
            "Language":langStr
            ]
        
        // print("Json Object is valid",devicedata)
        //print(jsonObject)
        return  jsonObject
    }
     
}

