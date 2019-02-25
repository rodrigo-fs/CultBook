//
//  SeedData.swift
//  CultBook
//
//  Created by Rodrigo França on 20/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation

fileprivate class SeedData{
    
    struct Key : Hashable {
        static func == (lhs: SeedData.Key, rhs: SeedData.Key) -> Bool {
            return lhs.bookTitle == rhs.bookTitle && rhs.bookType == lhs.bookType
        }
        
        let bookTitle : String
        let bookType : String
        
        init(bookTitle :String, bookType : Any){
            self.bookType = String(describing: bookType)
            self.bookTitle = bookTitle
            
        }
    }
    
    static var books : [Key : Book] = [:]
    static var clients : [String : Client] = [:]
    
    
    static func createDataMock(){
        let book1 = Book(title: "The Great Gatsby", isbn: "9781471229015", description: "", author: "F. Scott Fitzgerald", stock: 10, price: 15.0, registerDate: Date(), category: .Action)
        let aBook1 = AudioBook(title: "One Hundred Years of Solitude", isbn: "9783462013115", description: "", author: "Gabriel García Márquez", stock: 100, price: 8.00, registerDate: Date(), category: .Romance, timeDuration: Duration(hours: 1, minutes: 40, seconds: 00), narrator: "José")
        let eBook1 = EBook(title: "Don Quixote", isbn: "9783462013115", description: "", author: "Miguel de Cervantes", stock: 20, price: 3, registerDate: Date(), category: .Romance, size: 10240, downloadAddress: "http://books.com/download/donquixote", type: .pdf)
        addOrUpdateBook(book: book1)
        addOrUpdateBook(book: eBook1)
        addOrUpdateBook(book: aBook1)
        
        let client1 = Client(name: "Rodrigo", login: "rodrigo", password: "123", email: "rodrigoo_fs@hotmail.com", phone: "(41)99893-7894", street: "av brasil", number: 123, complement: "", district: "Uberaba", city: "Curitiba", state: "Parana", zipCode: "81580-000")
        let client2 = Client(name: "Midoria", login: "midoria", password: "allmigth", email: "midoria", phone: "(22)3456-8901", street: "av japao", number: 456, complement: "", district: "Uberaba", city: "Curitiba", state: "Paraná", zipCode: "87651-182")
        addOrUpdateClient(client: client1)
        addOrUpdateClient(client: client2)
}
    
    static func getDate(day: Int, month: Int, year: Int) -> Date?{
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        return Calendar.current.date(from: dateComponents)
    }
    
    fileprivate static func addOrUpdateBook (book : Book){
        books[Key(bookTitle: book.title, bookType: type(of: book))] = book
    }
    
    fileprivate static func addOrUpdateClient (client : Client){
        clients[client.name] = client
    }
}

class SalesManager{
    
    enum LoginError : Error{
        case UserNotFound
        case IncorrectPassword
    }

    static let sharedInstance = SalesManager()
    
    private init() {
        initializeData()
    }
    
    private func initializeData(){
        SeedData.createDataMock()
    }
    
    private func login(login : String, password : String) throws -> Client{
        guard let user = SeedData.clients.filter({$0.key == login}).first?.value
        else{
            throw LoginError.UserNotFound
        }
        if !(user.password == password){
            throw LoginError.IncorrectPassword
        }
        return user
    }
    
    private func verifyUsername(username : String) throws{
        guard SeedData.clients[username] != nil else{
            throw LoginError.UserNotFound
        }
    }
    
    public func loginHandler() -> Client?{
        print(DataLoaderStrings.informYourAccount.localized)
        print(DataLoaderStrings.user.localized)
        do{
            guard let username = readLine() else {
                print(DataLoaderStrings.invaliduserNameInformation.localized)
                return nil
            }
            try verifyUsername(username: username)
            print(DataLoaderStrings.password.localized)
            guard let password = readLine() else{
                print(DataLoaderStrings.invalidPasswordInformation.localized)
                return nil
            }
            
            let user = try login(login: username, password: password)
            return user
        }
        catch LoginError.UserNotFound{
            print(DataLoaderStrings.invaliduserNameInformation.localized)
            return nil
        }
        catch LoginError.IncorrectPassword{
            print(DataLoaderStrings.incorrectPassword)
            return nil
        }
        catch {
            print("\(error.localizedDescription)")
            return nil
        }
    }
    
    public func registerBookHandler() {
        print(DataLoaderStrings.informBookData.localized)
        
        guard let text = readLine() else { return }
        showAllBooksTypes()
        let option = Int(text)
        switch option {
            case 1:
                print(1)
            case 2:
                print(2)
            case 3:
                print(3)
            default:
                print(DataLoaderStrings.invalidOption.localized)
                return
        }
    }
    
    private func registerABook(){
        print()
    }
    
    
    public func showAllBooks(){
        SeedData.books.forEach{
            switch($0.key.bookType) {
                case "EBook":
                    let aux = $0.value as! EBook
                    printEbook(ebook: aux)
                case "AudioBook":
                    let aux = $0.value as! AudioBook
                    printaBook(aBook: aux)
                case "Book":
                    printBook(book: $0.value, firstCall: true)
                default:
                    return
            }
        }
    }
 
    private func printBook(book : Book, firstCall : Bool = false){
        print(DataLoaderStrings.bookTitle.localized + "\(book.title)")
        print(DataLoaderStrings.bookAuthor.localized + "\(book.author)")
        print(DataLoaderStrings.bookDescription.localized + "\(book.description)")
        print(DataLoaderStrings.bookIsbn.localized + "\(book.isbn)")
        print(DataLoaderStrings.bookPrice.localized + "\(book.price)")
        print(DataLoaderStrings.bookRegisterDate.localized + "\(printableDate(date: book.registerDate))")
        if firstCall {
            print("")
        }
    }

    
    private func printEbook(ebook : EBook){
        printBook(book: ebook)
        print(DataLoaderStrings.eBookSize.localized + "\(ebook.size)MB")
        print(DataLoaderStrings.eBookType.localized + "\(String(describing: ebook.type))")
        print("")
    }
    
    private func printaBook(aBook : AudioBook){
        printBook(book: aBook)
        print(DataLoaderStrings.abNarrator.localized + "\(aBook.narrator)")
        print(DataLoaderStrings.abTimeDuration.localized + "\(aBook.timeDuration.complete())")
        print("")
    }
    
    private func printableDate(date : Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    private func showAllBooksTypes(){
        DataLoaderStrings.BookOptions.allCases.forEach{
            print($0.rawValue)
        }
    }
}

