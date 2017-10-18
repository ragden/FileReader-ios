//
//  ViewController.swift
//  Filer Reader
//
//  Created by edgar paz moreno on 17/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let model = WordCountModel()
    let spinner : FRSpinner = FRSpinner()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Logic methods
    func readData() {
        spinner.start(self)
        model.readFromFile {
            self.tableView.reloadData()
            self.spinner.stop()
        }
    }

}

// MARK - UITableViewDelegate
extension ViewController : UITableViewDelegate {
    
}

// MARK - UITableViewDataSource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FRWordTableViewCell = tableView.dequeueReusableCell(withIdentifier: FRWordTableViewCell.identifier) as! FRWordTableViewCell
        cell.loadData(data: model.datasource[indexPath.row])
        return cell
    }
    
    
}
