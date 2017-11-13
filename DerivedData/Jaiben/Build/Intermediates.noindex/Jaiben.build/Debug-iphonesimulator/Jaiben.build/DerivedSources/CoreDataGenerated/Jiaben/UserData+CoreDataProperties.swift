//
//  UserData+CoreDataProperties.swift
//  
//
//  Created by kidnapper on 05/11/2017.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var birthday: String?
    @NSManaged public var charactor: String?
    @NSManaged public var coin: Int16
    @NSManaged public var email: String?
    @NSManaged public var energy: Int16
    @NSManaged public var exp_current: Int16
    @NSManaged public var gender: String?
    @NSManaged public var id: String?
    @NSManaged public var isFBLogin: Bool
    @NSManaged public var level: Int16
    @NSManaged public var lottery_ticket: Int16
    @NSManaged public var name: String?
    @NSManaged public var nickname: String?
    @NSManaged public var password: String?
    @NSManaged public var user_menu_default: String?

}
