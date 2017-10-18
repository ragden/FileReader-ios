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
    private let backgroundView : UIView = UIView()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    init() {
        let screenBounds : CGRect = UIScreen.main.bounds
        let targetFrame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: screenBounds.size.height)
        super.init(frame: targetFrame)
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.corporateLightBlue
        backgroundView.alpha = 0.5
        addSubview(backgroundView)
        
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = UIColor.corporateBlue
        indicator.center = center
        addSubview(indicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        let screenBounds : CGRect = UIScreen.main.bounds
        let targetFrame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: screenBounds.size.height)
        super.init(frame: targetFrame)
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.corporateLightBlue
        backgroundView.alpha = 0.5
        addSubview(backgroundView)
        
        indicator.color = UIColor.corporateBlue
        indicator.center = center
        addSubview(indicator)
    }
    
    func start(_ inController: UIViewController) {
        self.indicator.startAnimating()
        inController.view.addSubview(self)
    }
    
    func stop() {
        self.removeFromSuperview()
        self.indicator.stopAnimating()
    }

}
