//
//  Extensions.swift
//  CultBook
//
//  Created by Rodrigo França on 21/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation


enum DataLoaderStrings : String {
    //Main Menu
    case menuHeader = "CultBook Menu"
    case separator = "=================="
    case option1 = "1 - Login"
    case option2 = "2 - Register Book"
    case option3 = "3 - Search Book"
    case option4 = "4 - List Books"
    case option9 = "9 - Exit"
    case invalidOption = "Invalid option"
    case endingProgram = "Ending Program"
    //Login
    case informYourAccount = "Inform your account"
    case user = "User:"
    case password = "Password:"
    case userNotFound = "User not found!"
    case invaliduserNameInformation = "Invalid Username Information!"
    case invalidPasswordInformation = "Invalid Password Information!"
    case incorrectPassword = "Incorrect password!"
    case someOtherError = "Login Error, please try again"
    //Register Book
    case registerBook = "Register Book"
    case informBookData = "Inform Book Data to Register"
    case informBookType = "Inform Book Type"
    
    enum BookOptions : String, CaseIterable {
        case option1AudioBook = " 1 - AudioBook"
        case option2Ebook = "2 - EBook"
        case option3book = "3 - Book"
    }
    
    //Show All Books
    //Book
    case bookTitle = "Title: "
    case bookIsbn =  "ISBN: "
    case bookDescription = "Description: "
    case bookAuthor = "Author: "
    case bookStock = "Stock: "
    case bookPrice = "Price: $"
    case bookRegisterDate = "Register date: "
    case bookCategory = "Category: "
    
    
    //AudioBook
    case abTimeDuration = "Time duration: "
    case abNarrator = "Narrator: "
    
    //Ebook
    case eBookSize = "Size: "
    case eBookDownloadAddress = "Download Adress: "
    case eBookType = "Type: "

    var localized: String {
        return self.rawValue
    }
}
