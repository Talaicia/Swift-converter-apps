//
//  ContentView.swift
//  TimeConversion
//
//  Created by Talaicia Isaacs on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var timeAmount = 0.0
    @State private var timeFrom = "seconds"
    @State private var timeTo = "minutes"
    
    let timeOptions = ["seconds", "minutes", "hours", "days"]
    var convertedTime: Double {
        var result = timeAmount
        
        switch(timeFrom, timeTo){
        case ("seconds", "minutes"):
            result = timeAmount / 60
        case ("seconds", "hours"):
            result = timeAmount / 3600
        case ("seconds", "days"):
            result = timeAmount / 86400
        case ("minutes", "seconds"):
            result = timeAmount * 60
        case ("minutes", "hours"):
            result = timeAmount / 60
        case ("minutes", "days"):
            result = timeAmount / 1440
        case ("hours", "seconds"):
            result = timeAmount * 3600
        case ("hours", "minutes"):
            result = timeAmount * 60
        case ("hours", "days"):
            result = timeAmount / 24
        case ("days", "seconds"):
            result = timeAmount * 86400
        case ("days", "minutes"):
            result = timeAmount * 1440
        case ("days", "hours"):
            result = timeAmount * 24
        default:
            break
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter a Time to Convert:"){
                    TextField("Number from", value: $timeAmount, format: .number)
                }
                Section("Select a Time:"){
                    Picker("Length From", selection: $timeFrom){
                        ForEach(timeOptions, id: \.self){option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Select a Time:"){
                    Picker("Length to", selection: $timeTo){
                        ForEach(timeOptions, id: \.self){option in Text(option.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section("Converted Time:"){
                    Text(convertedTime, format: .number )
                
            }
            .navigationTitle("Time Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
       
        }
       
      
    }
}

#Preview {
    ContentView()
}
