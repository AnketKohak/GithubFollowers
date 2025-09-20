//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Anket Kohak on 20/09/25.
//

import Foundation


enum ErrorMessage : String{
    
    case invalid = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid responce from the server. Please try again later"
    case invalidData = "The data recived from the server was invalid. Please try again later"
}
