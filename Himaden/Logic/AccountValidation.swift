//
//  AccountValidation.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/01.
//  Copyright © 2020 tishii2479. All rights reserved.
//

class AccountValidation {
    
    // Check the fields input and validate. If input was correct, this method returns nil
    // Otherwise, this method returns an error message
    class func checkValidation(userInput: String, item: AccountUtils.Item) -> String?{
        if userInput == "" { return "入力してください" }
        switch item {
        case .prefecture:
            return validationForPrefecture(input: userInput)
        case .birthday:
            return validationForBirthday(input: userInput)
        case .sex:
            return validationForSex(input: userInput)
        case .email:
            return validationForEmail(input: userInput)
        case .name:
            return validationForName(input: userInput)
        case .userId:
            return validationForUserId(input: userInput)
        case .password:
            return validationForPassword(input: userInput)
        }
    }
    
    private class func validationForPrefecture(input: String) -> String? {
        return nil
    }
    private class func validationForBirthday(input: String) -> String? {
        return nil
    }
    private class func validationForSex(input: String) -> String? {
        return nil
    }
    private class func validationForEmail(input: String) -> String? {
        return nil
    }
    private class func validationForName(input: String) -> String? {
        if let error = validationLength(input: input, min: 4, max: 20) { return error }
        
        return nil
    }
    private class func validationForUserId(input: String) -> String? {
        if let error = validationLength(input: input, min: 4, max: 20) { return error }
        
        return nil
    }
    private class func validationForPassword(input: String) -> String? {
        if let error = validationLength(input: input, min: 4, max: 20) { return error }
        return nil
    }
    
    // Check the input length is proper
    // Argument min and max are used to set the limit of the input length
    private class func validationLength(input: String, min: Int, max: Int) -> String? {
        if input.count < min {
            return "入力が短すぎます、\(min)文字以上での入力が求められています"
        } else if input.count > max {
            return "入力が長すぎます、\(max)文字以下の入力が求められています"
        }
        return nil
    }
    
}
