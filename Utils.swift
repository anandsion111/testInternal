//
//  utils.swift
//  testInternal
//
//  Created by Total Solution on 13/10/22.
//

import Foundation
public class Utils{
    public init(){}
    func setData(key: String, value: String){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey:key)
         }
    func getData(key: String)->Any{
        let defaults = UserDefaults.standard
        let res =  defaults.string(forKey: key)
            let res1:String = (res?.replacingOccurrences(of: "Optional(\"", with: ""))!
            let result:String = res1.replacingOccurrences(of: "\"", with: "")
       return result
    }
}
