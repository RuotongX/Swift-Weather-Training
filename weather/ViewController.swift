//
//  ViewController.swift
//  weather
//
//  Created by RuotongX on 2019/3/6.
//  Copyright © 2019 RuotongX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation
import Foundation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
   
    
    let apiKey = "d1580a5eaffdf2ae907ca97ceaff0235"
    var lat = 36.8485
    var lon = 174.7633
    var activityIndicator : NVActivityIndicatorView?
    let locationManage = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indicatorSize: CGFloat = 70
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2,y:(view.frame.width-indicatorSize)/2,width:indicatorSize,height:indicatorSize)
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
        activityIndicator!.backgroundColor = UIColor.black
        view.addSubview(activityIndicator!)
        
        locationManage.requestWhenInUseAuthorization()
        
        activityIndicator!.startAnimating()
       
        if(CLLocationManager.locationServicesEnabled()){
            self.locationManage.delegate = self
            self.locationManage.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManage.distanceFilter = kCLLocationAccuracyKilometer
            locationManage.startUpdatingLocation()
        }
    }
    func locationManage(manager:CLLocationManager!,didUpdateLocations locations:[AnyObject]!){
        print("get location")
        let location:CLLocation = locations[locations.count-1] as! CLLocation
        if(location.horizontalAccuracy>0){
            self.locationManage.stopUpdatingLocation()
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
            Alamofire.request("https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)").responseJSON{
                response in
                self.activityIndicator?.stopAnimating()
                if let responseStr = response.result.value{
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]
                    let iconName = jsonWeather["icon"].stringValue
                    
                    self.locationLabel.text = jsonResponse["name"].stringValue
                    self.conditionLabel.text = jsonWeather["main"].stringValue
                    self.temperatureLabel.text = "\(Int(round(jsonTemp["temp"].doubleValue))"
                }
                
            }
            print(location.coordinate)
//            self.textLabel.text = "latitude \(location.coordinate.latitude) longitude \(location.coordinate.longitude)"
        }
        
    }
    private func locationManage(manager: CLLocationManager!, didFailWithError error: Error!) {
        print(error)
    }
    
}

