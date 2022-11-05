//
//  apicall.swift
//  testInternal
//
//  Created by Total Solution on 10/10/22.
//

import Foundation
import UIKit
//import SwiftyJSON
import SwiftUI
import WebKit
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
public class api: Codable {
    public init() {}
    struct ResponseDataAPI: Decodable {
    
        var access_token: String
        var refresh_token : String
        
    }

    public func Call(requestBody:Any, method:String, EventUrl:String)->(Any){
        let result = ""
        do{
        //Call Auth Api EveryTime
        let authfunc = AuthToken()
        let tokenJsonData = authfunc.getToken()
        let JSONString = "\(tokenJsonData)"
        let jsonData = JSONString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let json = try decoder.decode(ResponseDataAPI.self, from: jsonData)
       // let json = try! JSONDecoder().decode(JSON.self, from: jsonData)
        print("API Request Body ",requestBody)
            let token = json.access_token
            let refresh_token = json.refresh_token
        //let token = json["access_token"].stringValue
        //let refresh_token = json["refresh_token"].stringValue
        let result = ""
        let semaphore = DispatchSemaphore (value: 0)
        let parameters = "\(requestBody)"
        //        let parameters = "{\n\n\n\n    \"imei\": \"18263146679922545\",\n\n\n\n    \"appName\": \"COMM\",\n\n\n\n    \"identifier\": \"Comm_224422\",\n\n\n\n    \"sessionID\": \"63452354656435232455\",\n\n\n\n    \"userPlatform\": \"0\",\n\n\n\n    \"interactionId\": \"01V5D2U178JMA0UABSGSFDFDE\",\n\n\n\n    \"srNumber\": \"1-19416007436436457369\",\n\n\n\n    \"misc1\": null,\n\n\n\n    \"misc2\": null,\n\n\n\n    \"misc3\": null,\n\n\n\n    \"eventList\": [\n\n\n\n        {\n\n\n\n            \"eventId\": \"3204\",\n\n\n\n            \"eventName\": \"Movie Watched\",\n\n\n\n            \"properties\": {},\n\n\n\n            \"propertyValues\": {\n\n\n\n                \"22079\": \"Amir\",\n\n\n\n                \"22077\": \"Amir\",\n\n\n\n                \"22076\": \"Lal Singh\"\n\n\n\n            },\n\n\n\n            \"occuredOn\": \"1660287094090\",\n\n\n\n            \"type\": \"app\"\n\n\n\n        }\n\n\n\n\n\n    ]\n\n\n\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "\(SdkConstants.API_URL)/\(EventUrl)")!,timeoutInterval: Double.infinity)
        request.addValue("bearer \(token)", forHTTPHeaderField: "authorization")
        request.addValue("no-cache", forHTTPHeaderField: "cache-control")
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        //request.addValue("36672c09-c15a-5360-11f6-3fef1bf1b993", forHTTPHeaderField: "postman-token")
        
        request.httpMethod = "\(method)"
        request.httpBody = postData
        print("postData ===> \(postData)")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                let result=String(describing: error)
                return
            }
            print(String(data: data, encoding: .utf8)!)
            let result=String(data: data, encoding: .utf8)!
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        }
        catch{
            
        }
        return result;
    }
    
}

