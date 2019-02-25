//
//  Book.swift
//  CultBook
//
//  Created by Rodrigo França on 17/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation



enum BooksCategory{
    case Action
    case Terror
}

protocol Book
{
    var title : String { get set }
    var isbn : String { get set }
    var description : String { get set }
    var author : String { get set }
    var stock : Int { get set }
    var price : Double { get set }
    var registerDate : Date { get }
    var category : BooksCategory { get }

}

struct Duration {
    var hours : Int
    var minutes : Int
    var seconds : Int
    init (hours: Int, minutes: Int, seconds : Int){
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}

class AudioBook : Book {
    var title: String
    var isbn: String
    var description: String
    var author: String
    var stock: Int
    var price: Double
    var registerDate: Date
    var category: BooksCategory
    var timeDuration : Duration
    var narrator : String
    
    init(title : String, isbn : String, description : String, author: String, stock : Int, price : Double, registerDate : Date, category : BooksCategory, timeDuration: Duration, narrator : String) {
        self.title = title
        self.isbn = isbn
        self.description = description
        self.author = author
        self.stock = stock
        self.price = price
        self.registerDate = registerDate
        self.category = category
        self.timeDuration = timeDuration
        self.narrator = narrator
    }
}

enum ArchieveType{
    case pdf
    case doc
}


class EBook : Book{
    var title: String
    var isbn: String
    var description: String
    var author: String
    var stock: Int
    var price: Double
    var registerDate: Date
    var category: BooksCategory
    var size : Int
    var downloadAddress : String
    var type : ArchieveType
    
    init(title : String, isbn : String, description : String, author: String, stock : Int, price : Double, registerDate : Date, category : BooksCategory, size : Int, downloadAddress : String, type : ArchieveType) {
        self.title = title
        self.isbn = isbn
        self.description = description
        self.author = author
        self.stock = stock
        self.price = price
        self.registerDate = registerDate
        self.category = category
        self.size = size
        self.downloadAddress = downloadAddress
        self.type = type
    }
}
