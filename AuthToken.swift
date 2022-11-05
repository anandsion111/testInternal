//
//  AuthToken.swift
//  testInternal
//
//  Created by Total Solution on 07/10/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
public class AuthToken{
    public init() {}
    public func getToken()->(Any){
        var result:String = ""
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "\(SdkConstants.AUTH_PARAMETER)"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "\(SdkConstants.AUTH_API_URL)")!,timeoutInterval: Double.infinity)
        request.addValue("Basic \(SdkConstants.AUTH_TOKEN)", forHTTPHeaderField: "authorization")
        request.addValue("no-cache", forHTTPHeaderField: "cache-control")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        request.addValue("732e90a7-2370-34d0-d5c4-cac4035cbaf9", forHTTPHeaderField: "postman-token")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
         print(String(data: data, encoding: .utf8)!)
          result = String(data: data, encoding: .utf8)!
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
         
        return result
        
    }
    
}
