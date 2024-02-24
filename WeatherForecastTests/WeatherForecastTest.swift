//
//  WeatherForecastTest.swift
//  WeatherForecastTests
//
//  Created by Anand Yadav on 23-02-2024.
//

import XCTest
@testable import WeatherForecast

final class WeatherForecastTest: XCTestCase {
    var viewModel : WeatherForecastViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = WeatherForecastViewModel()
    }
    
    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }
    
    func testFetchWeatherDataFailure() async {
        let result:Result = await viewModel.fetchWeatherData(cityName: "Invalid City Name")
        switch result {
        case .success(let weatherData):
            XCTAssertNotNil(weatherData)
        case .failure(let error):
            XCTAssertNotNil(error, "Weather data should not be nill")

        }
    }
    
    func testFetchWeatherDataSuccess() async {
        let result:Result = await viewModel.fetchWeatherData(cityName: "Delhi")
        switch result {
        case .success(let weatherData):
            XCTAssertNotNil(weatherData)
        case .failure(let error):
            XCTAssertNotNil(error, "Weather data should not be nill")
        }
    }
    
    func testHelperGetCelsius() {
        XCTAssertEqual(Helper.getCelsius(valueInKelvin: 304.15), "31°C")
    }
    
    func testImagefromName() {
        XCTAssertNotNil(Helper.getImageName(desc: "clear"), "Get system image named clear")
    }

    func testGetTimeFromInt() {
        XCTAssertEqual(Helper.getTimeFromInt(sunrise: 1708777421), "5:53 PM")
    }
}

