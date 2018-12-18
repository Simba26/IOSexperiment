//
//  person.swift
//  workEight
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 2016110401. All rights reserved.
//

import Foundation
enum Gender:Int {
    case male,female
    static func >(gender1:Gender,gender2:Gender)->Bool
    {
        return gender1.rawValue>gender2.rawValue
    }
}
class Person: CustomStringConvertible
{
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    var gender:Gender
    var fullName:String
    {
        get
        {
            return self.firstName+" "+self.lastName
        }
    }
    init(firstName:String, lastName:String,age:Int,gender:Gender)
    {
        self.firstName=firstName
        self.lastName=lastName
        self.age=age
        self.gender=gender
    }
    convenience init(name:String,age:Int)
    {
        self.init(firstName:name,lastName:"",age:age,gender:Gender.female)
    }
    static func ==(p1:Person,p2:Person)->Bool
    {
        return p1.fullName==p2.fullName&&p1.age==p2.age
    }
    static func != (p1:Person,p2:Person)->Bool
    {
        return p1.fullName != p2.fullName||p1.age != p2.age
    }
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
}
