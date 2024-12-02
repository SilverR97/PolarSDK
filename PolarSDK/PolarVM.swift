//
//  PolarVM.swift
//  PolarSDK
//
//  Created by Reinaldo Plata P on 11/29/24.
//
import Foundation
import Combine

class SensorViewModel: ObservableObject {
    @Published var accelerometerData: (x: Double, y: Double, z: Double) = (0, 0, 0)
    @Published var gyroscopeData: (x: Double, y: Double, z: Double) = (0, 0, 0)
    
    private let model: PolarSensorModel
    private var cancellables = Set<AnyCancellable>()
    
    init(deviceId: String) {
        model = PolarSensorModel(deviceId: deviceId)
        
        model.sensorDataPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] sensorData in
                print("Received new sensor data")
                self?.accelerometerData = sensorData.accelerometer
                self?.gyroscopeData = sensorData.gyroscope
                print("Updated ViewModel - Acc: \(self?.accelerometerData), Gyro: \(self?.gyroscopeData)")
            }
            .store(in: &cancellables)
        
    }
    
    func startStreaming() {
        model.startStreaming()
    }
}
