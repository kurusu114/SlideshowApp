//
//  enlargedVIewController.swift
//  SlideshowApp
//
//  Created by 來栖暢宏 on 07.04.2020.
//  Copyright © 2020 nobuhiro.kurusu. All rights reserved.
//

import UIKit

class enlargedVIewController: UIViewController {
    
    @IBOutlet weak var enlargedImageView: UIImageView!
    let imageArray = ["pic1", "pic2", "pic3"]
    var resultImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentImageIndexNumber = resultImageIndex
        self.enlargedImageView.image = UIImage(named:imageArray[currentImageIndexNumber])
    }
}
