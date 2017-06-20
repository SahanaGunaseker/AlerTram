//
//  ViewController.swift
//  AlerTram
//
//  Created by Sahana on 6/19/17.
//  Copyright © 2017 Sahana. All rights reserved.
//

import UIKit
import UserNotifications
import Social

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var back: UIButton!
    
    
    
    @IBAction func bAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Share", message: "Share this task!", preferredStyle: .actionSheet)
        
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default){(action) in
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("Task Details")
                self.present(post, animated: true, completion: nil)
            }
            else{self.showAlert(service: "Facebook")}
        }
        
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default){(action) in
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("Task Details")
                self.present(post, animated: true, completion: nil)
            }
            else{self.showAlert(service: "Twitter")}
        }
        
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title:"Dismiss", style: .cancel, handler:nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
        @IBAction func action(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "You've got a new notification"
        content.subtitle = list[myIndex]
        content.body = c[myIndex]
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger:trigger)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = list[myIndex]
        descLabel.text = c[myIndex]
        myImageView.image = UIImage(named: c[myIndex] + ".jpg")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in})
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
