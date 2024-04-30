//
//  WeatherManager.swift
//  demo
//
//  Created by HONGYI LIANG on 24/4/2024.
//
import Foundation
import CoreLocation
class WeatherManager {
    //Asynchronously fetches the current weather data for latitude and longitude
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        //construct the url for the openweathermap api with latitude,longitude,and api keys and ensure the url is valid, otherwise trigger the else statement
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("c01827a4befd5d5a490b9904109942b7")&units=metric") else { fatalError("Missing URL")}
        
        //create a url request object twith the API URL
        let urlRequest = URLRequest(url: url)
        //perform the network request asynchronously
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        //check if the http response status code is 200, indicating success
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}//crash the app if the response is failed
        //decodes the json data into an instance of responseBody
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        //return the decoded weather data
        return decodedData
    }
}
/*class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        // Hardcode for testing:
        let testLatitude = -33.8679
        let testLongitude = 151.2073

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(testLatitude)&lon=\(testLongitude)&appid=c01827a4befd5d5a490b9904109942b7&units=metric") else {
            fatalError("Missing URL")
        }

        // Continue as before
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }

}*/

//Model for parsing the json data returned by the weather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
//extension to simplify formatting the temperature values
extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
