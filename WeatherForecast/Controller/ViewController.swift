//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import UIKit

class ViewController: UIViewController, WeatherForecastDelegate {
    
    @IBOutlet weak var txtCityName: UITextField!
    @IBOutlet weak var imgViewWeatherDesc: UIImageView!
    @IBOutlet weak var lblTemperture: UILabel!
    @IBOutlet weak var lblWeatherDesc: UILabel!
    @IBOutlet weak var lblSunriseTime: UILabel!
    @IBOutlet weak var lblSunsetTime: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblWeatherError: UILabel!
    
    private let viewModel = WeatherForecastViewModel()
    var weatherData: WeatherData!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.weatherDelegate = self
    }
    
    func reloadData() {
        txtCityName.text = ""
        if viewModel.weatherData != nil {
            setUpViews()
        } else {
            lblWeatherError.isHidden = false
        }
    }
    
    @IBAction func btnClickCheckWeather(_ sender: Any) {
        viewModel.fetchWeatherData()
    }
    
    func hideViews() {
        imgViewWeatherDesc.isHidden = true
        lblWeatherDesc.isHidden = true
        lblTemperture.isHidden = true
        lblSunriseTime.isHidden = true
        lblSunsetTime.isHidden = true
        lblHumidity.isHidden = true
        lblWindSpeed.isHidden = true
        lblWeatherError.isHidden = true
    }
    
    func setUpViews() {
        imgViewWeatherDesc.isHidden = false
        lblWeatherDesc.isHidden = false
        lblTemperture.isHidden = false
        lblSunriseTime.isHidden = false
        lblSunsetTime.isHidden = false
        lblHumidity.isHidden = false
        lblWindSpeed.isHidden = false
        imgViewWeatherDesc.image = UIImage(systemName:Helper.getImageName(desc: viewModel.weatherData?.weather?.first?.description))
        imgViewWeatherDesc.tintColor = .systemBrown
        lblWeatherDesc.text = viewModel.weatherData?.weather?.first?.description
        lblTemperture.text = Helper.getCelsius(valueInKelvin: viewModel.weatherData?.main?.temp)
        lblSunriseTime.text = Helper.getTimeFromInt(sunrise: (viewModel.weatherData?.sys?.sunrise)!)
        lblSunsetTime.text = Helper.getTimeFromInt(sunrise: (viewModel.weatherData?.sys?.sunset)!)
        lblHumidity.text = String(format:"%d",((viewModel.weatherData?.main?.humidity)!)) + " %"
        lblWindSpeed.text =  String(format:"%.0f",(((viewModel.weatherData?.wind?.speed!)! * 1.60934))) + " km/h"
    }
    

}

