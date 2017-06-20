//
//  FirstViewController.swift
//  AlerTram
//
//  Created by Sahana on 6/17/17.
//  Copyright © 2017 Sahana. All rights reserved.
//

import UIKit



   var list = ["Complete project","Buy Groceries","Visit Dentist"]
   var c = ["Work", "Groceries", "Doctor"]
var myIndex = 0

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    @IBOutlet weak var TableView: UITableView!
   
    @IBOutlet weak var l1: UILabel!
  
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (list.count)
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = c[indexPath.row]
        cell.imageView?.image = UIImage(named: "Warning_36828.png")
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
        return(cell)
    }
    
     public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    
    {
        if editingStyle == UITableViewCellEditingStyle.delete{
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        TableView.reloadData()
    }

        override func viewDidLoad() {
            TableView.backgroundView = UIImageView(image: UIImage(named: "images-2.jpeg"))
            
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   }
