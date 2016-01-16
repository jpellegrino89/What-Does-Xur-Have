//
//  InterfaceController.swift
//  What Does Xur Have WatchKit Extension
//
//  Created by Joseph Pellegrino on 1/16/16.
//  Copyright © 2016 Joseph Pellegrino. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var interfaceTable: WKInterfaceTable!
    let api = "356db85cbf8944f2895df502b7553098"

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        getXurInventory()

        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    private func getItemDetails(itemHash: String) -> String
    {
        let urlString = ("https://www.bungie.net/Platform/Destiny/Manifest/6/\(itemHash)/")
        var itemName = "itemName"
        
        let request = NSMutableURLRequest(URL
            : NSURL(string: urlString)!)
        let session = NSURLSession.sharedSession()
        request.addValue(api, forHTTPHeaderField: "X-Api-Key")
        request.HTTPMethod = "GET" // or POST or whatever
        
        //print(request)
        
        let data = session.dataTaskWithRequest(request, completionHandler:{ data, response, error -> Void in
            
            if data != nil{
                var result = JSON(data:data!)
                //print(result)
                let itemName = result["Response"]["data"]["inventoryItem"]["itemName"]
                print(itemName)

            
                //let jsonItemCount = result["Response"]["data"]["saleItemCategories"][2]["saleItems"].arrayValue.count
                //print ("Number of Exotics", jsonItemCount)
                
                //self.interfaceTable?.setNumberOfRows(jsonItemCount, withRowType: "ServerTableRowController")
                //for var index = 0; index < jsonItemCount; ++index{
                   // print(result["Response"]["data"]["saleItemCategories"][2]["saleItems"][index]["item"]["itemHash"])
                    
                    

                //}
                      }
                
            else{
                print("Data is nil")
            }
            
            
            
        })
        
        data.resume()


        return itemName
    
    }
    
    private func getXurInventory(){
        
        //apiKeyLabel?.setHidden(true)
        //refreshButtonOutlet?.setHidden(true)
        //interfaceTable?.setHidden(false)
        
        let onlineName = "Online"
        let offlineName = "Offline"
        
        
        let request = NSMutableURLRequest(URL
            : NSURL(string: "https://www.bungie.net/Platform/Destiny/Advisors/Xur/")!)
        let session = NSURLSession.sharedSession()
        request.addValue(api, forHTTPHeaderField: "X-Api-Key")
        request.HTTPMethod = "GET" // or POST or whatever
        
        //print(request)
        
        let data = session.dataTaskWithRequest(request, completionHandler:{ data, response, error -> Void in
            
            if data != nil{
                var result = JSON(data:data!)
                print(result)
                let jsonItemCount = result["Response"]["data"]["saleItemCategories"][2]["saleItems"].arrayValue.count
                print ("Number of Exotics", jsonItemCount)
                
                self.interfaceTable?.setNumberOfRows(jsonItemCount, withRowType: "ServerTableRowController")
                for var index = 0; index < jsonItemCount; ++index{
                    let itemHash = result["Response"]["data"]["saleItemCategories"][2]["saleItems"][index]["item"]["itemHash"]
                    
                    print(itemHash)
                    
                    print(self.getItemDetails(String(itemHash)))
                    
                    
                }
                
                
                
                /*
                for item in result["Response"]["data"]["saleItemCategories"][2]["categoryTitle"].arrayValue.enumerate(){
                    
                    
                    
                    print(item)
                    
                    //print(item["name"].stringValue, " - ", item["reporting"].stringValue)
                    //self.serverArray.append(item["name"].stringValue)
                    let row = self.interfaceTable?.rowControllerAtIndex(item.index) as? InventoryTableRow
                    row?.itemName.setText(item.element["name"].stringValue)
                    row?.ID.setText(String(item.element["id"].int32Value))
                    
                    print(String(item.element["id"].int32Value))
                    
                    if(item.element["reporting"].boolValue==true)
                    {
                        print(item.element["name"], " is ", item.element["reporting"].boolValue)
                        row?.itemIcon.setImage(UIImage(named:onlineName))
                    }
                    
                    if(item.element["reporting"].boolValue == false)
                    {
                        print(item.element["name"], " is ", item.element["reporting"].boolValue)
                        row?.itemIcon.setImage(UIImage(named:offlineName))
                        
                    }
                    
                    //self.idArray.append(String(item.element["id"].int32Value))
                    
                }
*/
            }

            else{
                print("Data is nil")
            }

            
            
                })
        
        data.resume()
        
        //}
        
    }
    


}
