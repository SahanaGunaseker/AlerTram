//
//  SecondViewController.swift
//  AlerTram
//
//  Created by Sahana on 6/17/17.
//  Copyright © 2017 Sahana. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet var pickerView: UIView!
    var ref : DatabaseReference?
    
    
    let category = ["Work", "Doctor", "Groceries"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = category[row]
    }
    
    @IBAction func addItem(_ sender: Any) {
        ref = Database.database().reference()
        
        if(input.text != ""){
            
            ref?.child("list1").childByAutoId().setValue(input.text)
            
            list.append(input.text!)
            c.append(label.text!)
            input.text = ""
            label.text = ""
            
        }
    }

    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

