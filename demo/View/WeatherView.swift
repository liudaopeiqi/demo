//
//  WeatherView.swift
//  demo
//
//  Created by HONGYI LIANG on 25/4/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody //the weather data passed to the view
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)//A vertical stack for the header section
                        .bold().font(.title)//city name displayed in the title font
                    
                    Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)//display current date and time with light font weight
                }
                .frame(maxWidth: .infinity, alignment: .leading)//make the vstack fill the width and align to left
                    
                    Spacer()
                    
                    VStack {//This part is for the main weather content
                        HStack {//Horizontal stack for weather icons and temperature
                            
                            VStack(spacing: 20) {
                                Image(systemName: "cloud.rain.fill")
                                    .font(.system(size: 40))//weather icon as a system image
                                
                                Text(weather.weather[0].main)
                            }
                            .frame(width: 150, alignment: .leading)//set the width and the content
                            
                            Spacer()//separates the weather icon and temperature visually
                            
                            Text(weather.main.feelsLike.roundDouble() + "°")
                                      .font(.system(size: 100))
                                      .fontWeight(.bold)
                                      .padding()
                        }//display the 'feel like' temperature prominently
                        
                        Spacer()//add more vertical space
                            .frame(height: 250)
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(width: .infinity, alignment: .leading)
            
            
            
            VStack {//vertical stack for the footer section
                Spacer()//push the footer to the bottom of the ZStack
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)//vertical stack for detailed weather data
                    
                    HStack{//horizontal stack for displaying min temperature
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()//separate min and max temperature displays
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{//horizontal stack for displaying wind speed and humidity
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)//set the background color for the footer section
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)//let the view extend into the safe area at the bottom
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)//set the color to dark
    }
}

/*struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}*/

#Preview {
    WeatherView(weather: previewWeather)
}
