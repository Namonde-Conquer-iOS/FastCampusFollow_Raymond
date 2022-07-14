//
//  ViewController.swift
//  Weather
//
//  Created by sanghyo on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFetchWeather(_ sender: UIButton) {
        guard let cityName = cityNameTextField.text else { return }
        getCurrentWeather(from: cityName)
        view.endEditing(true)
    }
    
    private func configurationView(with weatherInfo: WeatherInformation) {
        cityLabel.text = weatherInfo.name
        if let weatherInformation = weatherInfo.weather.first {
            weatherLabel.text = weatherInformation.description
        }
        tempLabel.text = "\(Int(weatherInfo.temp.temp - 273.15))도"
        minTempLabel.text = "최저: \(Int(weatherInfo.temp.minTemp - 273.15))도"
        maxTempLabel.text = "최고: \(Int(weatherInfo.temp.maxTemp - 273.15))도"

    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    private func getCurrentWeather(from city: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0662d3bb6031b8f7f0a9b405440dc188") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            let successRange = 200..<300
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self ,from: data) else { return }
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configurationView(with: weatherInformation)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                debugPrint(errorMessage)
                DispatchQueue.main.async {
                    self?.showAlert(with: errorMessage.message)
                }
            }
            
        }.resume()
    }
}

