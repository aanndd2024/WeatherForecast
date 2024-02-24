//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import UIKit
import ProgressHUD

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
    @IBOutlet weak var weatherInfoContainer: UIStackView!
    
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
        if viewModel.weatherData != nil {
            setUpViews()
        } else {
            lblWeatherError.isHidden = false
        }
    }
    
    @IBAction func btnClickCheckWeather(_ sender: Any) {
        ProgressHUD.animate("Loading...")
        if let cityName = txtCityName.text, cityName.isEmpty == false {
            Task { @MainActor in
                let result:Result = await viewModel.fetchWeatherData(cityName: cityName)
                ProgressHUD.dismiss()
                switch result {
                  case .success(let weatherData):
                    viewModel.weatherData = weatherData
                  case .failure(let error):
                    showError(error: error)
                  }
            }
        } else {
            ProgressHUD.dismiss()
            showError(error: DataError.invalidCityName)
        }
    }
    
    func showError(error :Error) {
        hideViews()
        lblWeatherError.isHidden = false
        lblWeatherError.text = error.localizedDescription
    }
    
    func hideViews() {
        weatherInfoContainer.isHidden = true
        imgViewWeatherDesc.isHidden = true
        lblWeatherDesc.isHidden = true
        lblTemperture.isHidden = true
        lblWeatherError.isHidden = true
    }
    
    func setUpViews() {
        weatherInfoContainer.isHidden = false
        lblWeatherError.isHidden = true
        imgViewWeatherDesc.isHidden = false
        lblWeatherDesc.isHidden = false
        lblTemperture.isHidden = false
        imgViewWeatherDesc.image = UIImage(systemName:Helper.getImageName(desc: viewModel.weatherData?.weather?.first?.description))
        imgViewWeatherDesc.tintColor = .systemBrown
        lblWeatherDesc.text = viewModel.weatherData?.weather?.first?.description
        lblTemperture.text = Helper.getCelsius(valueInKelvin: viewModel.weatherData?.main?.temp)
        lblSunriseTime.text = Helper.getTimeFromInt(sunrise: (viewModel.weatherData?.sys?.sunrise) ?? 0)
        lblSunsetTime.text = Helper.getTimeFromInt(sunrise: (viewModel.weatherData?.sys?.sunset) ?? 0)
        lblHumidity.text = String(format:"%d",((viewModel.weatherData?.main?.humidity) ?? 0)) + " %"
        lblWindSpeed.text =  String(format:"%.0f",((viewModel.weatherData?.wind?.speed) ?? 0 * 1.60934)) + " km/h"
    }
    

}

