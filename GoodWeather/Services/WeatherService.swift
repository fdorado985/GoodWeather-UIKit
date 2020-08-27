//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

enum ServiceError: String, Error {
  case unableToComplete = "Unable to complete your request. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again."
  case invalidData = "The data received from the server was invalid. Please try again."
  case unableToParse = "The data received is unable to parse, please check the models match!"
}

struct WeatherResponse: Decodable {

  let name: String
  let main: Weather
}

final class WeatherService {

//  #error("Get and add your API Key from NewsApi")
//  static private let apiKey = "<YOUR_API_KEY>"

  static func getCurrentWeather(query: String, unit: String, _ completion: @escaping (Result<CityViewModel, ServiceError>) -> Void) {
    guard var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather") else { return }
    urlComponents.queryItems = [
      URLQueryItem(name: "q", value: query),
      URLQueryItem(name: "appId", value: apiKey),
      URLQueryItem(name: "unit", value: unit)
    ]

    guard let url = urlComponents.url else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        completion(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
        let cityViewModel = CityViewModel(name: weatherResponse.name, temperature: weatherResponse.main.temp)
        completion(.success(cityViewModel))
      } catch {
        completion(.failure(.unableToParse))
      }
    }.resume()
  }
}
