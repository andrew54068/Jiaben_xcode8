//
//  social.swift
//  Jaiben
//
//  Created by kidnapper on 08/04/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

class social{
    private var selection = [Int]()
    private var partners = [userData]()
    
    public func setSelection(_data : [Int]){
        selection = _data
    }
    
    public func setPartners(_partners : [userData]){
        partners = _partners
    }
    
    public func getPartners()->[userData]{
        return partners
    }
    
    public func getFirstPartner()->userData{
        return partners[0]
    }
    
}

