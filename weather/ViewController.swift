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
    var lat = 36.111
    var lon = 174.111
    var activityIndicator : NVActivityIndicatorView?
    let locationManage = CLLocationManager()
    var locate = location()
    
    
    
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
    func locationManager(_ manager:CLLocationManager,didUpdateLocations locations:[CLLocation]){
        print("get location")
        let location:CLLocation = locations[0]
        if(location.horizontalAccuracy>0){
            self.locationLabel.text = "Meeeo~"
            self.locationManage.stopUpdatingLocation()
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
            Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON{
                response in
                self.activityIndicator?.stopAnimating()
                if let responseStr = response.result.value{
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]
                    let iconName = jsonWeather["icon"].stringValue
                    
                    self.locationLabel.text = jsonResponse["name"].stringValue
                    self.conditionImageView.image = UIImage(named: iconName)
                    self.conditionLabel.text = jsonWeather["main"].stringValue
                    self.temperatureLabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "EEEE"
                    self.dayLabel.text = dateFormatter.string(from: date)
                    let loca = jsonResponse["name"].stringValue
                    let id = jsonResponse["id"].stringValue
                    self.locate.name = loca
                    self.locate.id = id
                    self.locate.lat = self.lat
                    self.locate.long = self.lon
                    UserDefaults().setValue(id, forKey: "locate")
                    UserDefaults().setValue(loca, forKey: "name")
                }
                
            }
            print(location.coordinate)
            self.locationManage.stopUpdatingLocation()
//            self.textLabel.text = "latitude \(location.coordinate.latitude) longitude \(location.coordinate.longitude)"
        }
        
    }
    private func locationManage(manager: CLLocationManager!, didFailWithError error: Error!) {
        print(error)
        self.locationLabel.text = "Fail"
        self.activityIndicator?.stopAnimating()
    }
  
    
}

