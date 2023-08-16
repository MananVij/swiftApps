//
//  LoginModels.swift
//  VIPArchitechture
//
//  Created by Manan Vij on 16/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
    // MARK: Use cases
    struct LoginInfo {
        var userName : String
        var password : String
    }
    
    enum User
    {
        struct Request
        {
            var loginInfo: LoginInfo
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
}
