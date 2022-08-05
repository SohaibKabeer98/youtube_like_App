//
//  ViewController.swift
//  youtube_likeApp
//
//  Created by Avanza on 8/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        }


}

