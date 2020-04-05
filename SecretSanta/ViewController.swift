//
//  ViewController.swift
//  SecretSanta
//
//  Created by Camila Luisa Farias de Lima on 06/03/20.
//  Copyright © 2020 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    var viewMenu: MenuView
    
    init() {
        viewMenu = MenuView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = viewMenu
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

