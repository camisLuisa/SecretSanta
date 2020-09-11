//
//  SplashViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 05/04/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    private let viewSplash: SplashView

    init() {
        viewSplash = SplashView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = viewSplash
        super.viewDidLoad()
        
        BaseWebService().request(url: URL(string: "https://postman-echo.com/get?foo1=bar1&foo2=bar2")!)
        // Do any additional setup after loading the view.
        
//        CreateAccountService.createAccount(with: "camilateste@gmail.com", password: "123456") { result in
//            print(result)
//        }
    }
}
