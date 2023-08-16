//
//  ImageInteractor.swift
//  imageVIP
//
//  Created by Manan Vij on 16/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ImageBusinessLogic
{
    func doAPI(request: Image.ImageAPI.Request)
}

protocol ImageDataStore
{
    //var name: String { get set }
}

class ImageInteractor: ImageBusinessLogic, ImageDataStore
{
    var presenter: ImagePresentationLogic?
    var worker: ImageWorker?
    //var name: String = ""
    
    // MARK: Do API
    
    func doAPI(request: Image.ImageAPI.Request)
    {
        worker = ImageWorker()
        worker?.doSomeWork(completionHandler: {[weak self] success, message, url in
            let response = Image.ImageAPI.Response(success: success, msg: message, url: url)
            self?.presenter?.presentAPI(response: response)
        })
    }
}
