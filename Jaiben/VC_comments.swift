//
//  VC_comments.swift
//  Jaiben
//
//  Created by kidnapper on 26/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_comments: VC_Base, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var storeName: UILabel!
    @IBOutlet var amount: UILabel!
    
    
    @IBOutlet var comments: UITableView!
    
    var commentArray = [[String: String]]()
    var amountOfComments: Int = 0
    var imageData: Data?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amountOfComments
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "commentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! commentsTableViewCell
        
//        cell.commenterProfile = commentArray[indexPath][""]
//        之後加上從使用者獲取頭像
//        cell.commenterLevel.text = commentArray[indexPath.row]["level"]
//        之後加上等級
        let FBid = commentArray[indexPath.row]["FBid"]!
        let id = FBid.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let str = "https://graph.facebook.com/\(id)/picture?type=normal"
//        print("str = \(str)")
        let FBProfileURL = URL(string:"https://graph.facebook.com/\(id!)/picture?type=normal")
        print("FBPrefileURL = \(FBProfileURL!)")
        downloadImageFromURL(URL: FBProfileURL!, f:{
            print("imageData = \(self.imageData!)")
            cell.commenterProfile.image = UIImage(data: self.imageData!) })
        DispatchQueue.main.async {
            
            cell.commenterName.text = self.commentArray[indexPath.row]["nickname"]
            cell.comment.text = self.commentArray[indexPath.row]["content"]
        }
        
        print("cell.commenterName = \(cell.commenterName)")
        
        return cell
    }
    
    func downloadImageFromURL(URL: URL, f:@escaping ()->() = {return}){
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL){
            (data, response, error) in
            if error != nil{
                print("error=\(error)")
            }else{
                if let res = response as? HTTPURLResponse {
                    print("download profile photo with response code \(res.statusCode)")
                    
                }else{
                    print("could not get response code for some reason.")
                }
                DispatchQueue.main.async {
                    if data != nil{
                        self.imageData = data
                    }
                    f()
                }
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.sublayers!.remove(at: 0)
//        
//        let input = "storeID=\(storeData.id!)"
//        let request = buildJBRequest(input: input, urlAfterJB: "Comment/getComment.php", log: "load comments")
//        buildDataTaskWithRequst(request: request, requestName: nil, f: {
//            self.storeName.text = storeData.name
//            self.amount.text = "共\(self.amountOfComments)人評論"
////            self.comments.delegate = self
////            self.comments.dataSource = self
////            print("commentArray[0][\"nickname\"] = \(self.commentArray[0]["nickname"])")
//            self.comments.reloadData()
//        })
        // Do any additional setup after loading the view.
    }
    
    override func getDataAfterRequest(result: String) {
        
        var comments = decodeCommentsFromJson(result: result)!
        print("comments = \(comments)")
        if comments.count != 0{
            amountOfComments = comments.count
            for i in 0 ..< comments.count{
                print("i = \(i)")
                self.commentArray.append(comments[i])
            }
            print("result = \(result)")
            print("commentArray = \(commentArray)")
        }
        return
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func decodeCommentsFromJson(result: String) -> [[String:String]]?{
        do{
            if let data = result.data(using: .utf8){
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:String]]
                print("success decodeFromJson")
                //                print("json = \(json)")
                
                print("json = \(json)")
                return json
            }else{
                print("here")
                return nil
            }
        }catch{
            print(error)
            print("留言抓不成功")
            return nil
        }
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
