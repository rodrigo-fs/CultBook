//
//  main.swift
//  CultBook
//
//  Created by Rodrigo França on 17/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation


let salesManager = SalesManager.sharedInstance
var option : Int? = 0
var innerOption : Int? = 0
func showMenu() {
    print(DataLoaderStrings.menuHeader.localized)
    print(DataLoaderStrings.separator.localized)
    print(DataLoaderStrings.option1.localized)
    print(DataLoaderStrings.option2.localized)
    print(DataLoaderStrings.option3.localized)
    print(DataLoaderStrings.option4.localized)
    print(DataLoaderStrings.option9.localized)
}

func showInvalidOptionMessage(){
    print(DataLoaderStrings.invalidOption.localized)
}

func showNotImplementedYetMessage(){
    print(DataLoaderStrings.functionNotImplementedYet.localized)
}

func innerUserMenu(){
    
}

while(option != 9){
    showMenu()
    if let response = readLine(){
        if let aux = Int(response){
            option = aux
            switch option{
                case 1:
                    if var client = SalesManager.sharedInstance.loginHandler(){
                        print(DataLoaderStrings.functionNotImplementedYet.localized)
                        //while(innerOption != 9){
                            
                        //}
                    }
                case 2:
                    //SalesManager.sharedInstance.registerBookHandler()
                    showNotImplementedYetMessage()
                case 3:
                    showNotImplementedYetMessage()
                case 4:
                    SalesManager.sharedInstance.showAllBooks()
                case 9:
                    print(DataLoaderStrings.endingProgram.localized)
                default:
                    showInvalidOptionMessage()
            }
        }
        else{
            showInvalidOptionMessage()
        }
    }
    else{
        showInvalidOptionMessage()
    }
}

