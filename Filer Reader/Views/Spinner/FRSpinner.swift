//
//  FRSpinner.swift
//  Filer Reader
//
//  Created by Edgar Paz on 18/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class FRSpinner: UIView {
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    init() {
        let screenBounds : CGRect = UIScreen.main.bounds
        self.frame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: screenBounds.size.height)
//        self.indicator.backgroundColor =
        
    }
    
    func start(_ inController: UIViewController) {
        
    }

}
