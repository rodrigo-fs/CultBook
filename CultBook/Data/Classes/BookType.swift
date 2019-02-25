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
    case Art
    case AutoBiography
    case CookBook
    case Drama
    case Fantasy
    case Horror
    case Mystery
    case Romance
    case Thriller
    case Unknown
}

class Book
{
    var title : String
    var isbn : String
    var description : String
    var author : String 
    var stock : Int
    var price : Double
    var registerDate : Date
    var category : BooksCategory
    
    init(){
        self.title = ""
        self.title = ""
        self.isbn = ""
        self.description = ""
        self.author = ""
        self.stock = 0
        self.price = 0
        self.registerDate = Date()
        self.category = .Unknown
        
    }
    
    init(title : String, isbn : String, description : String, author : String, stock : Int, price : Double, registerDate : Date, category: BooksCategory) {
        self.title = title
        self.isbn = isbn
        self.description = description
        self.author = author
        self.stock = stock
        self.price = price
        self.registerDate = registerDate
        self.category = category
    }
    
    
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
    
    public func complete() -> String{
        return "\(self.hours):\(self.minutes):\(self.seconds)"
    }
}

class AudioBook : Book{

    var timeDuration : Duration
    var narrator : String
    
    override init(){
        self.timeDuration = Duration(hours: 0, minutes: 0, seconds: 0)
        self.narrator = ""
        super.init()
    }
    
    init(title : String, isbn : String, description : String, author: String, stock : Int, price : Double, registerDate : Date, category : BooksCategory, timeDuration: Duration, narrator : String) {
        self.timeDuration = timeDuration
        self.narrator = narrator
        super.init(title: title, isbn: isbn, description: description, author: author, stock: stock, price: price, registerDate: registerDate, category: category)
    }
}

enum ArchieveType{
    case pdf
    case doc
    case Unknown
}


class EBook : Book{

    var size : Int
    var downloadAddress : String
    var type : ArchieveType
    
    override init(){
        self.size = 0
        self.downloadAddress = ""
        self.type = .Unknown
        super.init()
    }
    
    init(title : String, isbn : String, description : String, author: String, stock : Int, price : Double, registerDate : Date, category : BooksCategory, size : Int, downloadAddress : String, type : ArchieveType) {
        self.size = size
        self.downloadAddress = downloadAddress
        self.type = type
        super.init(title: title, isbn: isbn, description: description, author: author, stock: stock, price: price, registerDate: registerDate, category: category)
    }
}
