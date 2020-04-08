//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 來栖暢宏 on 07.04.2020.
//  Copyright © 2020 nobuhiro.kurusu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = ["pic1.jpg", "pic2.jpg", "pic3.jpg"]
    var imageIndexNumber = 0
    var timer: Timer!
    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var playOrStopLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            playOrStopLabel.setTitle("再生", for: .normal)
        }
        let enlargedVIewController:enlargedVIewController = segue.destination as! enlargedVIewController
        var currentImageIndex = 0
        currentImageIndex = imageIndexNumber
        enlargedVIewController.resultImageIndex = currentImageIndex
    }

    @IBAction func previousImageButton(_ sender: Any) {
        if self.timer == nil {
            imageIndexNumber -= 1
            if imageIndexNumber <= -1 {
                imageIndexNumber = 2
            }
        photoImageView.image = UIImage(named:imageArray[imageIndexNumber])
        }
    }
    
    @IBAction func nextImageButton(_ sender: Any) {
        if self.timer == nil {
            imageIndexNumber += 1
            if imageIndexNumber >= 3 {
                imageIndexNumber = 0
            }
            photoImageView.image = UIImage(named:imageArray[imageIndexNumber])
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.imageIndexNumber += 1
        if imageIndexNumber >= 3 {
            imageIndexNumber = 0
        }
        self.photoImageView.image = UIImage(named:imageArray[imageIndexNumber])
    }
    
    @IBAction func playOrStopButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            playOrStopLabel.setTitle("停止", for: .normal)
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            playOrStopLabel.setTitle("再生", for: .normal)

        }
    }
    
    @IBAction func imageTap(_ sender: Any) {
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}
