//
//  SeedData.swift
//  CultBook
//
//  Created by Rodrigo França on 20/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation

private class SeedData{
    
    static var books : [Book] = []
    static var clients : [Client] = []
    
    static func createDataMock(){
        var book1 = Book(title: "The Great Gatsby", isbn: "9781471229015", description: "", author: "F. Scott Fitzgerald", stock: 10, price: 15.0, registerDate: getDate(day: 1, month: 1, year: 2001), category: .Action)
        var book2 = Book(title: "One Hundred Years of Solitude", isbn: "9783462013115", description: "", author: "Gabriel García Márquez", stock: 15, price: 20, registerDate: getDate(day: 2, month: 2, year: 2002), category: .Romance)
        var book3 = Book(title: "Don Quixote", isbn: "9788474641288", description: "", author: "Miguel de Cervantes", stock: 8, price: 30, registerDate: getDate(day: 03, month: 03, year: 2003), category: .Romance)
        books += [book1, book2, book3]
        
        
        var client1 = Client(name: "Rodrigo", login: "rodrigo", password: "123", email: "rodrigoo_fs@hotmail.com", phone: "(41)99893-7894", street: "av brasil", number: 123, complement: "", district: "Uberaba", city: "Curitiba", state: "Parana", zipCode: "81580-000")
        var client2 = Client(name: "Midoria", login: "midoria", password: "allmigth", email: "midoria", phone: "(22)3456-8901", street: "av japao", number: 456, complement: "", district: "Uberaba", city: "Curitiba", state: "Paraná", zipCode: "87651-182")
        clients += [client1, client2]
    }
    
    static func getDate(day: Int, month: Int, year: Int) -> Date?{
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        return Calendar.current.date(from: dateComponents)
    }
}

