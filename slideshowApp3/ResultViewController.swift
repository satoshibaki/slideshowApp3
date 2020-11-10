//
//  ResultViewController.swift
//  slideshowApp3
//
//  Created by 中村智史 on 2020/11/08.
//  Copyright © 2020 中村智史. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = self.image

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
