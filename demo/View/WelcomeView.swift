//
//  WelcomeView.swift
//  demo
//
//  Created by HONGYI LIANG on 24/4/2024.
//
import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager //access the shared LocationManager instance
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)//set the title
                
                Text("Please enter your location to get the weather in your area")
                    .padding() //adds padding around the text
            }
            .multilineTextAlignment(.center)
            .padding()
            //algins text to the center across multiple lines and adds padding around the nested VStack
            
            //location button that triggers location service and below will trigger a request for the current locations
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)//Rounds the corners of the button
            .symbolVariant(.fill) //uses the filled variant of the symbol inside the button
            .foregroundColor(.white) //sets the text and icon color to white
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) //expands the vstack to fill available space
    }
}


#Preview {
    WelcomeView()
}
