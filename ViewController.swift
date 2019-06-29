//
//  ViewController.swift
//  Janki-Demo
//
//  Created by admin on 6/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import CoreLocation


class ViewController: UIViewController,MKMapViewDelegate {

    var arrUserDetails = [UserProfileModal]()
    var arrUserPortfolio = [UserportfolioModal]()
    @IBOutlet var tblV : UITableView!
    @IBOutlet var vHeader : UIView!
    @IBOutlet var imgProfile : UIImageView!

    //MARK: View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblV.delegate = self
        tblV.dataSource = self
        tblV.tableHeaderView = vHeader
        tblV.tableFooterView = UIView()
        
        
        
        self.callProfileAPI()
        

       
    }
    

}

extension ViewController {
    func callProfileAPI()
    {
        //        if Reachability.isConnectedToNetwork()
        //        {
        

        let para = ["action":"profile","user_id":"46","user_type":"2","lld":"1"]

        print(para)
        
        Alamofire.request("http://dev.ncryptedprojects.com/thumbpin/ws-profile/", method: .post, parameters: para,encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
                
                
                switch response.result {
                case .success:
                    print(response)
//                    ApiUtillity.sharedInstance.dismissSVProgressHUD()
                    let dictVal = response.result.value
                    let dictMain:NSDictionary = dictVal as! NSDictionary
                    let statusCode = dictMain.value(forKey: "status") as! Int
                    if(statusCode == 1)
                    {
                        self.arrUserDetails.removeAll()
                        let data = dictMain.value(forKey: "data") as! NSDictionary
                        
                        let arrPortfolioData = data.value(forKey: "portfolio") as! NSArray
                        for obj in arrPortfolioData{
                            let obj = obj as! NSDictionary

                            self.arrUserPortfolio.append(UserportfolioModal(portfolio_id: obj.value(forKey: "portfolio_id") as! String, portfolio_image: obj.value(forKey: "portfolio_image") as! String))
                        }
                        
                        print(self.arrUserPortfolio)

                        
                        self.arrUserDetails.append(UserProfileModal(languages: data.value(forKey: "languages") as! String, user_email: data.value(forKey: "user_email") as! String, user_contact: data.value(forKey: "user_contact") as! String, user_type: data.value(forKey: "user_type") as! String, user_name: data.value(forKey: "user_name") as! String, user_location: data.value(forKey: "user_location") as! String, user_image: data.value(forKey: "user_image") as! String, user_desc: data.value(forKey: "user_desc") as! String, user_rating: data.value(forKey: "user_rating") as! String, latitude: data.value(forKey: "latitude") as! String,longitude : data.value(forKey: "longitude") as! String,arrPortfolio: self.arrUserPortfolio))
                        
                        print(self.arrUserDetails)
                        
                        DispatchQueue.main.async {
                            self.imgProfile.layer.borderWidth = 1
                            self.imgProfile.layer.masksToBounds = false
                            self.imgProfile.layer.borderColor = UIColor.black.cgColor
                            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.height/2
                            self.imgProfile.clipsToBounds = true
                            
                        }
                        
                        let urlImg = URL(string: self.arrUserDetails[0].user_image)
                        let d = try? Data(contentsOf: urlImg!)
                        
                        if let imageData = d {
                            let image = UIImage(data: imageData)
                            self.imgProfile.image = image
                        }

                        self.tblV.reloadData()

                    }
                    
                    else
                    {
                        
                    }
                case .failure(let error):
                    print(error)
                }
        }
        // }
        //        else
        //        {
        //            ApiUtillity.sharedInstance.dismissSVProgressHUD()
        //            ApiUtillity.sharedInstance.showErrorMessage(Title: "Internet Connection", SubTitle: "Internet connection Faild", ForNavigation: self.navigationController!)
        //        }
    }
}


extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 250
        }else{
            return UITableView.automaticDimension

        }
    }

    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblV.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.selectionStyle = .none
        if self.arrUserDetails .count > 0{
            if indexPath.row == 0{
                cell.lblPortfolio.isHidden = true
                cell.lblTitle.text = "Name"
                cell.lblDetails.text = self.arrUserDetails[0].user_name
            }else if indexPath.row == 1{
                cell.lblPortfolio.isHidden = true
                cell.lblTitle.text = "Description"
                cell.lblDetails.text = self.arrUserDetails[0].user_desc
            }else if indexPath.row == 2{
                cell.lblPortfolio.isHidden = true
                cell.lblTitle.text = "Contact"
                cell.lblDetails.text = self.arrUserDetails[0].user_contact
            }else if indexPath.row == 3{
                cell.lblPortfolio.isHidden = true
                cell.lblTitle.text = "Languages"
                cell.lblDetails.text = self.arrUserDetails[0].languages
            }else if indexPath.row == 4{
                cell.lblPortfolio.isHidden = true
                cell.lblTitle.text = "Email"
                cell.lblDetails.text = self.arrUserDetails[0].user_email
            }else if indexPath.row == 5{
                
                let cell = tblV.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
                cell.selectionStyle = .none
                
                cell.mapV.delegate = self
                
                
                let lat = Double(self.arrUserDetails[0].latitude)
                let long = Double(self.arrUserDetails[0].longitude)

                
                let coordinate = CLLocationCoordinate2DMake(lat!, long!)

                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                cell.mapV.addAnnotation(annotation)
                
                return cell

            }else if indexPath.row == 6{
                cell.lblPortfolio.isHidden = false
                cell.lblDetails.isHidden = true
                cell.lblTitle.isHidden = true
                cell.lblPortfolio.text = "Click here to check Portfolio"
                
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "PortfolioVC") as! PortfolioVC
            newViewController.arrUserPortfolio.removeAll()
            newViewController.arrUserPortfolio.append(contentsOf: self.arrUserPortfolio)
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
}
