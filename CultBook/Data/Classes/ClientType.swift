//
//  ClientType.swift
//  CultBook
//
//  Created by Rodrigo França on 20/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation

fileprivate struct Address{
    var street : String
    var number : Int
    var complement : String?
    var district : String
    var city : String
    var state : String
    var zipCode: String
    
    init(street : String, number : Int, complement : String?, district : String, city : String, state: String, zipCode: String) {
        self.street = street
        self.number = number
        self.complement = complement
        self.district = district
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class Client {
    var name : String
    var login : String
    var password : String
    var email : String
    var phone : String
    fileprivate var address : Address
    init(name : String, login : String, password : String, email : String, phone: String, street : String, number : Int, complement : String?, district : String, city : String, state: String, zipCode: String) {
        self.address = Address(street: street, number: number, complement: complement, district: district, city: city, state: state, zipCode: zipCode)
        self.name = name
        self.login = login
        self.password = password
        self.email = email
        self.phone = phone
    }
}
