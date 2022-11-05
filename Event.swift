//
//  EventLists.swift
//  testInternal
//
//  Created by Total Solution on 07/10/22.
//

import Foundation
import UIKit
//import SwiftyJSON
//import SwiftUI
public class Event {
    public init() {}
    
     public func Push(EventName:String, EventProperties: Any)->(Any){
        let deviceinfo = DeviceInfo()
        //let usermodal = UserModal()
        //  let JSONString = "\(EventProperties)"
        //let jsonData = JSONString.data(using: .utf8)!
        //let json = try! JSONDecoder().decode(JSON.self, from: jsonData)
        //let imei = json["imei"].stringValue
        let requestBody = "{\"imei\": \"\(deviceinfo.getImei())\",\"appName\": \"\(deviceinfo.getAppName())\",\"identifier\": \"\(deviceinfo.getidentifier())\",\"sessionID\":\"\(deviceinfo.getSessionId()) \",\"userPlatform\": \"1\",\"interactionId\": \"\(deviceinfo.getSrNumber())\",\"srNumber\": \"\(deviceinfo.getSessionId())\",\"misc1\": null,\"misc2\": null,\"misc3\": null,\"eventList\": [{\"eventId\": \"\",\"eventName\": \"\(EventName)\",\"properties\": \(EventProperties),\"propertyValues\": {},\"occuredOn\": \"\(deviceinfo.getDate())\",\"type\": \"app\"}]}"
        // print("requestBody  === \(requestBody)")
        let apicall = api()
        let result = apicall.Call(requestBody:requestBody, method:"POST", EventUrl:"save-event")
        return result
    }
    public func getEvents(message: String) {
        print("Log message: ", message)
    }
}
