//
//  detallesProducto.swift
//  TabbedApp1
//
//  Created by Oscar on 2/18/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class detallesProducto: UIViewController {

    @IBOutlet weak var nombreProducto: UILabel!
    
    let identificador = "Identificador"
    
    var nombre:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreProducto.text=nombre
        
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
