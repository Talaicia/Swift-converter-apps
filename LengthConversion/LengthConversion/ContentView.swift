//
//  ContentView.swift
//  LengthConversion
//
//  Created by Talaicia Isaacs on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var lengthAmount = 0.0
    @State private var lengthFrom = "meters"
    @State private var lengthTo = "kilometers"
    
    let lengthOptions = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var convertedLength: Double {
        var result = lengthAmount
        
        switch (lengthFrom, lengthTo){
        case ("meters", "kilometers"):
            result = lengthAmount / 1000
        case ("meters", "feet"):
            result = lengthAmount * 3.281
        case ("meters", "yards"):
            result = lengthAmount * 1.094
        case ("meters", "miles"):
            result = lengthAmount / 1609
        case ("kilometers", "meters"):
            result = lengthAmount * 1000
        case ("kilometers", "feet"):
            result = lengthAmount * 3281
        case ("kilometers", "yards"):
            result = lengthAmount * 1094
        case("kilometers", "miles"):
            result = lengthAmount / 1.609
        case ("feet", "meters"):
            result = lengthAmount / 3.281
        case ("feet", "kilometers"):
            result = lengthAmount / 3281
        case ("feet", "yards"):
            result = lengthAmount / 3
        case ("feet", "miles"):
            result = lengthAmount / 5280
        case ("yards", "meters"):
            result = lengthAmount / 3.281
        case ("yards", "kilometers"):
            result = lengthAmount / 1094
        case ("yards", "feet"):
            result = lengthAmount * 3
        case ("yards", "miles"):
            result = lengthAmount / 1760
        case ("miles", "meters"):
            result = lengthAmount * 1609
        case ("miles", "kilometers"):
            result = lengthAmount * 1.609
        case ("miles", "feet"):
            result = lengthAmount * 5280
        case ("miles", "yards"):
            result = lengthAmount * 1760
        default:
            break
        }
        return result
    }
    
    var body: some View {

        NavigationStack{
            Form {
                Section("Enter a number to convert:"){
                    TextField("Number", value: $lengthAmount, format: .number)
                }
                Section("Select Current Length:"){
                    Picker("Length From:", selection: $lengthFrom){
                        ForEach(lengthOptions, id: \.self){ option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Select Length to conver to:"){
                    Picker("Length To:", selection: $lengthTo){
                        ForEach(lengthOptions, id: \.self){ option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Converted Length:"){
                    Text(convertedLength, format: .number)
                }
            }
            .navigationTitle("Length Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
        }
       
    }

#Preview {
    ContentView()
}
