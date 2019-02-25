//
//  OrderType.swift
//  CultBook
//
//  Created by Rodrigo França on 17/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation

fileprivate struct OrderItem {
    var quantity : Int
    var price : Double
    var book : Book
    
    init(quantity : Int, price : Double, book : Book) {
        self.quantity = quantity
        self.price = price
        self.book = book
    }
}

enum PaymentType{
    case money
    case ticket
    
}

enum Situation{
    case WaitingPayment
    case Processing
    case Send
    case Finished
    case Canceled
    
}

class Order{
    fileprivate var orderItems : [OrderItem]
    var number : Int
    var emissionDate : Date
    var paymentType : PaymentType
    var amount : Double
    var situation : Situation
    
    init(number : Int, emissionDate : Date, paymentType : PaymentType, amount : Double, situation : Situation){
        self.orderItems = []
        self.number = number
        self.emissionDate = emissionDate
        self.paymentType = paymentType
        self.amount = amount
        self.situation = situation
    }
}


