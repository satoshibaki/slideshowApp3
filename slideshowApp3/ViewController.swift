//
//  ViewController.swift
//  slideshowApp3
//
//  Created by 中村智史 on 2020/11/07.
//  Copyright © 2020 中村智史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var Next: UIButton!
    
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0

    var imageIndex = 0
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = images[0]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        imageIndex -= 1
        
        if imageIndex < 0 {
            imageIndex = images.count - 1
        }
        imageView.image = images[imageIndex]
    }
        
    
    @IBAction func nextAction(_ sender: Any) {
        imageIndex += 1
            
            if imageIndex >= images.count {
                
                imageIndex = 0
            }
            
            imageView.image = images[imageIndex]
        }
    
    @IBAction func startStopAction(_ sender: Any) {
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            
            startStop.setTitle("一時停止", for: .normal)
            back.isEnabled = false
            Next.isEnabled = false
            
        } else {
            
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
            startStop.setTitle("再生", for: .normal)
            back.isEnabled = true
            Next.isEnabled = true
            
        }
    }
    
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.timer.invalidate()   // タイマーを停止する
        self.timer = nil
        startStop.setTitle("再生", for: .normal)
        back.isEnabled = true
        Next.isEnabled = true
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.image = imageView.image
    }
}

