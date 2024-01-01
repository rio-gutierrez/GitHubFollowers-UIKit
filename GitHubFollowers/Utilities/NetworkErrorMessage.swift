//
//  NetworkErrorMessage.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 1/1/24.
//

import Foundation

enum NetworkErrorMessage: String, Error {
    case invalidEndpoint = "This username created an invalid request. Please try again."
    case invalidURLSession = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from server. Please try again" // it'd be better to refactor this to differentiate 400 & 500 errors
    case invalidUsername = "No user found with that username. Please try again."
}
