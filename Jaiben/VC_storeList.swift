//
//  VC_storeList.swift
//  Jaiben
//
//  Created by kidnapper on 24/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_storeList: VC_Base, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var TB_storeList: UITableView!
    var totalStore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.sublayers!.remove(at: 0)
        let request = buildJBRequest(input: "", urlAfterJB: "Store/getAllStore.php", log: "get all store ")
        buildDataTaskWithRequst(request: request, requestName: nil, f:{
            self.TB_storeList.delegate = self
            self.TB_storeList.dataSource = self
            self.TB_storeList.reloadData()
            print("123321")})
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getDataAfterRequest(result: String) {
        let dataAfterDecode = self.decodeFromJson(result: result)!
//        print("dataAfterDecode = \(dataAfterDecode)")
        let storeList = dataAfterDecode["result"] as! [[String:String]]
//        print("storeList = \(storeList)")
        totalStore = (dataAfterDecode["result"] as AnyObject).count
        for i in 0 ..< (dataAfterDecode["result"] as AnyObject).count{
            storeData.allStoreList.append(storeList[i]["name"]!)
            print("storeList[i][name]! = \(storeList[i]["name"]!)")
            print("storeData.allStoreList[\(i)] = \(storeData.allStoreList[i])")
//            print("storeData.allStoreList[i] = \(storeData.allStoreList?[i])")
        }
        
        print("##########")
        
//        let decodedJson = result as [String:String]
//        print("decodeedJson = \(decodedJson)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("totalStore = \(totalStore)")
        return totalStore
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = storeData.allStoreList[indexPath.row]
        return cell
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
