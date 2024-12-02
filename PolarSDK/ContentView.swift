//
//  ContentView.swift
//  PolarSDK
//
//  Created by Reinaldo Plata P on 11/29/24.
//

import SwiftUI
import PolarBleSdk

struct ContentView: View {
    @ObservedObject var viewModel: SensorViewModel
       
       var body: some View {
           VStack {
               Text("Polar APK app test")
               Spacer().frame(height: 100)
               Text("Accelerometer data")
               Text("X: \(viewModel.accelerometerData.x)")
               Text("Y: \(viewModel.accelerometerData.y)")
               Text("Z: \(viewModel.accelerometerData.z)")
               
               Text("Gyroscope data")
               Text("X: \(viewModel.gyroscopeData.x)")
               Text("Y: \(viewModel.gyroscopeData.y)")
               Text("Z: \(viewModel.gyroscopeData.z)")
               
               Spacer().frame(height: 100)
               Button("Start Streaming") {
                   viewModel.startStreaming()
               }
           }
       }
   }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SensorViewModel(deviceId: "123443") // Asegúrate de inicializar correctamente el viewModel
        ContentView(viewModel: viewModel) // Añadir el nombre del parámetro `viewModel`
    }
}

