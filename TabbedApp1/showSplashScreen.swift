//
//  showSplashScreen.swift
//  TabbedApp1
//
//  Created by Andres Villavicencio on 2/19/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class showSplashScreen: UIViewController {
    
    func showNavController(){
    performSegueWithIdentifier("showSplashScreen", sender: self)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        performSelector(Selector("showNavController"), withObject:nil,afterDelay:2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
