//
//  UserModal.swift
//  testInternal
//
//  Created by Total Solution on 14/10/22.
//

import Foundation
public class UserModal{
    public init(){}
    static var FullName = "FullName"
    static var Email = "Email"
    static var DOB = "DOB"
    static var Mobile = "Mobile"
    static var Education = "Education"
    static var Occupation = "Occupation"
    static var PinCode = "PinCode"
    static var Gender = "Gender"
    let util = Utils()
    func getFullName()->Any{
        return util.getData(key: UserModal.FullName)
    }
    func setFullName(value:String){
        util.setData(key: UserModal.FullName, value: value )
    }
    func getEmail()->Any{
        return util.getData(key: UserModal.Email)
    }
    func setEmail(value:String){
        util.setData(key: UserModal.Email, value: value )
    }
    func getDob()->Any{
        return util.getData(key: UserModal.DOB)
    }
    func setDob(value:String){
        util.setData(key: UserModal.DOB, value: value )
    }
    func getMobile()->Any{
        return util.getData(key: UserModal.Mobile)
    }
    func setMobile(value:String){
        util.setData(key: UserModal.Mobile, value: value )
    }
    func getEducation()->Any{
        return util.getData(key: UserModal.Education)
    }
    func setEducation(value:String){
        util.setData(key: UserModal.Education, value: value )
    }
    func getOccupation()->Any{
        return util.getData(key: UserModal.Occupation)
    }
    func setOccupation(value:String){
        util.setData(key: UserModal.Occupation, value: value )
    }
    func getPinCode()->Any{
        return util.getData(key: UserModal.PinCode)
    }
    func setPinCode(value:String){
        util.setData(key: UserModal.PinCode, value: value )
    }
    func getGender()->Any{
        return util.getData(key: UserModal.Gender)
    }
    func setGender(value:String){
        util.setData(key: UserModal.Gender, value: value )
    }
}
