//
//  DetailsViewController.swift
//  AlerTram
//
//  Created by Sahana on 6/19/17.
//  Copyright © 2017 Sahana. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var titleText: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let titleText = titleText{
            titleLabel.text = titleText
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
