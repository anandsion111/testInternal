//
//  firebaseMessagingService.swift
//  iossdk
//
//  Created by Total Solution on 13/10/22.
//


import Foundation
//import FirebaseAuth
import UserNotifications
import FirebaseCore
import FirebaseMessaging
public class firebaseMessagingService{
    public init() {}
    public func getFcmToken()->(Any){
        
        let util = Utils()
        let token = util.getData(key: Constants.FCMTOKEN)
       // print("token==== ==== \(token)")
        if(token == nil) {
        if let token = Messaging.messaging().fcmToken {
            // token is current fcmToken
            util.setData(key: Constants.FCMTOKEN, value: token)
             return token
            
        }
        }else {
            return token
        }
         
        print("fcmtoken =\(String(describing: token))")
        return token
    }
}
