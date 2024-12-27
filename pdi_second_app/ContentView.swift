//
//  ContentView.swift
//  pdi_second_app
//
//  Created by Raphael de Castro on 27/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: String = ""
    @State private var selectedUnit: String = "Kilometers"
    
    @State var outputValue: String = ""
    @State var outputUnit: String = "Miles"
    
    func convertUnits() {
        guard let input = Double(inputValue) else {
            outputValue = "Invalid Input"
            return
        }
        
        var convertedValue: Double = input
        
        if selectedUnit == "Kilometers" && outputUnit == "Miles" {
            convertedValue = input * 0.621371
        } else if selectedUnit == "Miles" && outputUnit == "Kilometers" {
            convertedValue = input / 0.621371
        } else if selectedUnit == "Km/L" && outputUnit == "Mpg" {
            convertedValue = input * 2.35215
        } else if selectedUnit == "Mpg" && outputUnit == "Km/L" {
            convertedValue = input / 2.35215
        } else {
            outputValue = "Unidades não equivalentes"
            return
        }
        
        outputValue = String(format: "%.2f", convertedValue)
    }

    var body: some View {
        VStack {
            Image("IliaLogo")
                .resizable()         // Make the image resizable
                .scaledToFit()       // Maintain aspect ratio
                .frame(width: 100, height: 100) // Adjust size
                .padding()
            HStack {
                Image(systemName: "car.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .font(.title)
                Text("Conversor de unidades automotivas")
                    .font(.title)
                    .frame(alignment: .center)
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack {
                TextField("Insira um valor", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Unidade", selection: $selectedUnit) {
                    Text("Km").tag("Kilometers")
                    Text("Mi").tag("Miles")
                    Text("Km/L").tag("Km/L")
                    Text("Mpg").tag("Mpg")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }
            .padding()
            Text("para")
            HStack {
                TextField("Resultado", text: $outputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Unidade", selection: $outputUnit) {
                    Text("Km").tag("Kilometers")
                    Text("Mi").tag("Miles")
                    Text("Km/L").tag("Km/L")
                    Text("Mpg").tag("Mpg")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }.padding()
            Button(action: {
                            convertUnits()
                        }) {
                            Text("Converter")
                                .font(.title3)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
            Text("Desenvolvido por Raphael para o PDI da Ília Digital")
                .padding()
                .italic()
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    ContentView()
}

