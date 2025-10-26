//
//  ContentView.swift
//  VolumeConversion
//
//  Created by Talaicia Isaacs on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var volumeAmount = 0.0
    @State private var volumeTo = "mililiters"
    @State private var volumeFrom = "liters"
    
    let volumeOptions = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var conversionVolume: Double {
        var result = volumeAmount
        
        switch (volumeFrom, volumeTo) {
        case ("milliliters", "liters"):
            result = volumeAmount / 1000
        case ("milliliters", "cups"):
            result = volumeAmount / 236.6
        case ("milliliters", "pints"):
            result = volumeAmount / 473.2
        case ("milliliters", "gallons"):
            result = volumeAmount / 3785
        case ("liters", "milliliters"):
            result = volumeAmount * 1000
        case ("liters", "cups"):
            result = volumeAmount * 4.227
        case ("liters", "pints"):
            result = volumeAmount * 2.113
        case ("liters", "gallons"):
            result = volumeAmount / 3.785
        case ("cups", "milliliters"):
            result = volumeAmount * 236.6
        case ("cups", "liters"):
            result = volumeAmount / 4.227
        case ("cups", "pints"):
            result = volumeAmount / 2
        case ("cups", "gallons"):
            result = volumeAmount / 16
        case ("pints", "milliliters"):
            result = volumeAmount * 473.2
        case("pints", "liters"):
            result = volumeAmount / 2.113
        case ("pints", "cups"):
            result = volumeAmount * 2
        case ("pints", "gallons"):
            result = volumeAmount / 8
        case ("gallons", "milliliters"):
            result = volumeAmount * 3785
        case ("gallons", "liters"):
            result = volumeAmount * 3.785
        case ("gallons", "cups"):
            result = volumeAmount * 16
        case ("gallons", "pints"):
            result = volumeAmount * 8
        default:
            break
        
        }
        return result
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a Number to convert:"){
                    TextField("Volume from", value: $volumeAmount, format: .number )
                }
                Section("Select a Volume:"){
                    Picker("Volume From", selection: $volumeFrom){
                        ForEach(volumeOptions, id: \.self) { option in
                            Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Select a Volume:"){
                    Picker("volume from", selection: $volumeTo){
                        ForEach(volumeOptions, id: \.self){ option in
                            Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Converted Volume:"){
                    Text(conversionVolume, format: .number)
                }
                .navigationTitle("Volume Conversion")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
