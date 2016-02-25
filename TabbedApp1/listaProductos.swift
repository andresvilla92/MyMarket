//
//  listaProductos.swift
//  TabbedApp1
//
//  Created by Oscar on 2/18/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class listaProductos: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate{
    
    @IBOutlet var tableView2: UITableView!
    
    
    var datosFiltrados = [ ]
    
    
    private var datos = ["algo" ]
    
    let identificador = "Identificador"
    
    var tipoAlimento:String=""
    
    var aux: String = ""

    override func viewDidLoad() {
      
        
        if(tipoAlimento=="Carnes"){
            
            datos=[ "Arrachera", "Carne Molida", "Pechuga de Pollo", ]
        }
        if(tipoAlimento=="Lácteos"){
            datos=[ "Queso Azul","Queso Gouda", "Queso Oaxaca", "leche Deslacotsada", "yogurt Griego" ]
        }
        if(tipoAlimento=="Frutas"){
            datos=[ "Manzana", "Pera", "Sandia", "Piña" ]
        }
        if(tipoAlimento=="Verduras"){
            datos=[ "Limón", "Zanahorias", "Lechuga" ]
        }
        if(tipoAlimento=="Vinos y Licores"){
            datos=[ "Bacardi", "Tequila Azul", "Padre Kino", "Absolut Vodka" ]
        }
        if(tipoAlimento=="Postres"){
            datos=[ "Pastel de chocolate", "Chocolotin", "Gansitos" ]
        }
        if(tipoAlimento=="Cereañes"){
            datos=[ "Nesquick", "Zucaritas", "Luckycharms" ]
        }
        
        
        
        
          super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return datos.count
        
        if(tableView == self.searchDisplayController?.searchResultsTableView){
            return self.datosFiltrados.count
        }else{
            return self.datos.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier( identificador)
        var dato: String
        /*if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default, reuseIdentifier: identificador)
        }*/
        if(tableView == self.searchDisplayController?.searchResultsTableView){
            dato = self.datosFiltrados[indexPath.row] as! String
            aux = self.datosFiltrados[indexPath.row] as! String
        }else{
            dato = self.datos[indexPath.row]
        }
        cell?.textLabel?.text=dato
        return (cell)!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var dato: String
        
        if (tableView == self.searchDisplayController?.searchResultsTableView){
            dato = self.datosFiltrados[indexPath.row] as! String
            aux = self.datosFiltrados[indexPath.row] as! String
        }else{
            dato = self.datos[indexPath.row]
        }
        print(dato)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! detallesProducto
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        if(datosFiltrados.count>0){
           
            sigVista.nombre=aux
        }else{
        sigVista.nombre=datos[indice!]
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func buscar(searchText: String, scope: String = "Title"){
        self.datosFiltrados = self.datos.filter({( dato : String) -> Bool in
            
           var categoryMatch = (scope == "Title")
            var stringMatch =   dato.rangeOfString(searchText)
            
            return categoryMatch && (stringMatch != nil)
            
        })
    }
    
    func 	searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        
        self.buscar(searchString!, scope: "Title")
        return true
    }
    
    
    func 	searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        
        self.buscar(self.searchDisplayController!.searchBar.text!, scope: "Title")
        return true
    }
}
