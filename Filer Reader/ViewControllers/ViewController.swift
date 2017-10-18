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
    var orderMode : FileReaderOrder = .AppearOrder
    let pickerData : [String] = [NSLocalizedString("key.order.appear", comment: "Orden aparición"),
                                 NSLocalizedString("key.order.alphabetical", comment: "Alfabético"),
                                 NSLocalizedString("key.order.most.appears", comment: "Más apariciones")]
    private var picker: UIPickerView = UIPickerView()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        readData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func configureUI() {
        let orderButton = UIBarButtonItem(title: NSLocalizedString("key.order", comment: "Ordenar"), style: .done, target: self, action: #selector(ViewController.orderButtonSelected))
        self.navigationItem.setRightBarButton(orderButton, animated: true)
        
    }
    
    @objc func orderButtonSelected() {
        let screenBounds = UIScreen.main.bounds
        
        let title : String = NSLocalizedString("key.order", comment: "Ordenar")
        let alert : UIAlertController = UIAlertController(title: title, message: nil, preferredStyle:.actionSheet)
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 168)
        alert.view.addConstraint(height);
        
        let pickerFrame: CGRect = CGRect(x:0, y:20, width:screenBounds.width , height:150)
        picker = UIPickerView(frame: pickerFrame)
        
        picker.delegate = self
        picker.dataSource = self
        
        alert.view.addSubview(picker)
        
        let toolFrame = CGRect(x:17, y:5, width:screenBounds.width - 34, height:45)
        let toolView: UIView = UIView(frame: toolFrame)
        
        let buttonWidth = 100
        let xPosition = Int(screenBounds.width) - (buttonWidth + 30)
        let buttonOkFrame: CGRect = CGRect(x:xPosition, y:7, width:buttonWidth, height:30);
        
        let buttonOk: UIButton = UIButton(frame: buttonOkFrame);
        buttonOk.setTitle(NSLocalizedString("key.done", comment: "Hecho"), for: .normal);
        buttonOk.setTitleColor(UIColor.blue, for: .normal);
        toolView.addSubview(buttonOk);
        
        buttonOk.addTarget(self, action: #selector(donePressed), for: .touchDown);
        
        alert.view.addSubview(toolView);
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func donePressed() {
        orderMode = FileReaderOrder(rawValue: picker.selectedRow(inComponent: 0))!
        orderData()
        self.dismiss(animated: true, completion: nil);
    }
    
    // MARK: - Logic methods
    func readData() {
        spinner.start(self)
        model.readFromFile {
            self.tableView.reloadData()
            self.spinner.stop()
        }
    }
    
    func orderData() {
        spinner.start(self)
        let closure = {
            self.tableView.reloadData()
            self.spinner.stop()
        }
        switch orderMode {
        case .AppearOrder:
            model.sortByAppearingOrder(completion: closure)
            break
        case .Alphabetical:
            model.sortByAlphabetical(completion: closure)
            break
        case .MostAppear:
            model.sortByMostAppearingWord(completion: closure)
            break
        }
    }

}

// MARK: - UITableViewDataSource
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

// MARK: - UIPickerViewDelegate
extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
}
