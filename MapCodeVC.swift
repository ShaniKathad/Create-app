//
//  MapCodeVC.swift
//  Youtla
//
//  Created by nct48 on 10/09/19.
//  Copyright © 2019 Ncrypted Technologies. All rights reserved.
//

import UIKit

class MapCodeVC: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

extension LGRideDetailsForCustomerVC
{
    func getRoutes()
    {
        // Encode URL
        let directionString:String = self.getDirectionURL().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if (directionString != "")
        {
            ModelClass.sharedManager.getMapRoutes(vc: self, getDirectionURL: directionString) { (success) in
                
                DispatchQueue.main.async
                    {
                        let routes = success
                        
                        if routes.count == 0
                        {
                            return
                        }
                        let routeDict = routes[0] as! [String:Any]
                        let overview_polyline = routeDict["overview_polyline"] as! [String:Any]
                        let points = overview_polyline["points"] as! String
                        
                        self.viewForMap.clear()
                        
                        let path:GMSPath = GMSPath.init(fromEncodedPath: points)!
                        let polyLine:GMSPolyline = GMSPolyline.init(path: path)
                        polyLine.strokeWidth = 5.0
                        polyLine.strokeColor = UIColor.blue
                        polyLine.map = self.viewForMap
                        
                        let bounds = GMSCoordinateBounds(path: path)
                        self.viewForMap.cameraTargetBounds = bounds
                        
                        //let firstLocationPoint = self.arrLocationList.first!
                        var arrTempLocation = self.rideDetailsForCustomer.points
                        
                        arrTempLocation.remove(at: 0)
                        arrTempLocation.removeLast()
                        
                        if arrTempLocation.count > 0
                        {
                            for val in arrTempLocation
                            {
                                let position = CLLocationCoordinate2D(latitude: Double(val.pickupLat)!, longitude: Double(val.pickupLong)!)
                                let marker = GMSMarker(position: position)
                                marker.icon = GMSMarker.markerImage(with: .green)
                                marker.map = self.viewForMap
                            }
                        }
                        
                        let position1 = CLLocationCoordinate2D(latitude: Double(self.rideDetailsForCustomer.rideDetails.fromLat)!, longitude: Double(self.rideDetailsForCustomer.rideDetails.fromLong)!)
                        let marker1 = GMSMarker(position: position1)
                        marker1.icon = GMSMarker.markerImage(with: .blue)
                        marker1.map = self.viewForMap
                        
                        let position2 = CLLocationCoordinate2D(latitude: Double(self.rideDetailsForCustomer.rideDetails.toLat)!, longitude: Double(self.rideDetailsForCustomer.rideDetails.toLong)!)
                        let marker2 = GMSMarker(position: position2)
                        marker2.icon = GMSMarker.markerImage(with: .blue)
                        marker2.map = self.viewForMap
                }
            }
        }
    }
    
    
    func getDirectionURL() -> String
    {
        var viaString = ""
        
        var arrTempLocation = self.rideDetailsForCustomer.points
        
        arrTempLocation.remove(at: 0)
        arrTempLocation.removeLast()
        if arrTempLocation.count > 0
        {
            for stopPoint in arrTempLocation
            {
                //let newPoint = stopPoint
                if viaString.isEmpty
                {
                    let coordinateString = String(format:"via:%@,%@",stopPoint.pickupLat,stopPoint.pickupLong)
                    viaString.append(coordinateString)
                }
                else
                {
                    let coordinateString = String(format:"|via:%@,%@",stopPoint.pickupLat,stopPoint.pickupLong)
                    viaString.append(coordinateString)
                }
            }
        }
        
        // For understanding
        // https://maps.googleapis.com/maps/api/directions/json?origin=%@,%@&destination=%@,%@&waypoints=via:%@,%@&key=YOUR_API_KEY
        var finalDirectionString:String = ""
        if viaString.isEmpty
        {
            finalDirectionString = String(format:"https://maps.googleapis.com/maps/api/directions/json?origin=%@,%@&destination=%@,%@&key=%@",rideDetailsForCustomer.rideDetails.fromLat,rideDetailsForCustomer.rideDetails.fromLong,(rideDetailsForCustomer.rideDetails.toLat),(rideDetailsForCustomer.rideDetails.toLong),OtherThirdPartyKeys.googleDirectionKey)
        }
        else
        {
            finalDirectionString = String(format:"https://maps.googleapis.com/maps/api/directions/json?origin=%@,%@&destination=%@,%@&waypoints=%@&key=%@",rideDetailsForCustomer.rideDetails.fromLat,rideDetailsForCustomer.rideDetails.fromLong,(rideDetailsForCustomer.rideDetails.toLat),(rideDetailsForCustomer.rideDetails.toLong),viaString,OtherThirdPartyKeys.googleDirectionKey)
        }
        return finalDirectionString
    }
}
    
    
    
extension LGSearchRideVC: UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if txtOriginLocation == textField
        {
            //txtAddress.text = nil
            //https://developers.google.com/places/ios-api/
            //TODO: Display google place picker
            txtCurrentTextField = txtOriginLocation
            let acController = GMSAutocompleteViewController()
            acController.delegate = self
            present(acController, animated: true, completion: nil)
            return false
        }
        else if txtDestinationLocation == textField
        {
            //txtAddress.text = nil
            //https://developers.google.com/places/ios-api/
            //TODO: Display google place picker
            txtCurrentTextField = txtDestinationLocation
            let acController = GMSAutocompleteViewController()
            acController.delegate = self
            present(acController, animated: true, completion: nil)
            return false
        }
        else
        {
            return true
        }
    }
}
//https://stackoverflow.com/questions/28793940/how-to-add-google-places-autocomplete-to-xcode-with-swift-tutorial
extension LGSearchRideVC: GMSAutocompleteViewControllerDelegate
{
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace)
    {
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress!)")
        print("Place coordinate latitude: \(place.coordinate.latitude)")
        print("Place coordinate longitude: \(place.coordinate.longitude)")
        
        //latitude = String(place.coordinate.latitude)
        //longitude = String(place.coordinate.longitude)
        
        if txtDestinationLocation == txtCurrentTextField
        {
            latitudeDestination = place.coordinate.latitude
            longitudeDestination = place.coordinate.longitude
        }
        else if txtOriginLocation == txtCurrentTextField
        {
            latitudeOrigin = place.coordinate.latitude
            longitudeOrigin = place.coordinate.longitude
        }
        txtCurrentTextField.text = place.formattedAddress
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error)
    {
        // TODO: handle the error.
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController)
    {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
}
    
//////////////////////
import GooglePlaces
import GooglePlaces
import GoogleMaps
/////////////////////


// App delegate

    GMSPlacesClient.provideAPIKey(OtherThirdPartyKeys.googleDirectionKey)
    GMSServices.provideAPIKey(OtherThirdPartyKeys.googleDirectionKey)
