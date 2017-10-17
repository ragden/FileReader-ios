//
//  ViewController.swift
//  Filer Reader
//
//  Created by edgar paz moreno on 17/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let model = WordCountModel()
        model.readFromFile()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

