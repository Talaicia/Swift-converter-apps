//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Talaicia Isaacs on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var degreeAmount = 0.0
    @State private var temperatureFrom = "fahrenheit"
    @State private var temperatureTo = "Celsius"
    
    let temperatureOptions = ["fahrenheit", "celsius", "kelvin"]
    var convertedTemperature: Double {
           var result = degreeAmount
           
           switch (temperatureFrom, temperatureTo) {
           case ("fahrenheit", "celsius"):
               result = (degreeAmount - 32) * 5/9
           case ("fahrenheit", "kelvin"):
               result = (degreeAmount - 32) * 5/9 + 273.15
           case ("celsius", "fahrenheit"):
               result = (degreeAmount * 9/5) + 32
           case ("celsius", "kelvin"):
               result = degreeAmount + 273.15
           case ("kelvin", "fahrenheit"):
               result = (degreeAmount - 273.15) * 9/5 + 32
           case ("kelvin", "celsius"):
               result = degreeAmount - 273.15
           default:
               break
           }
           
           return result
       }
    var body: some View {
        NavigationStack {
            Form {
                Section ("Degree:") {
                    TextField("Degree", value: $degreeAmount, format: .number)
                }
                Section ("Pick Current Temperature:"){
                    Picker("Temperature From", selection: $temperatureFrom ){
                        ForEach(temperatureOptions, id: \.self){ option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section ("Pick Temperature to Convert To:"){
                    Picker("Temperature To", selection: $temperatureTo){
                        ForEach(temperatureOptions, id: \.self){ option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Converted Temperature"){
                    Text(convertedTemperature, format: .number)
                }
    
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        }
}

#Preview {
    ContentView()
}
