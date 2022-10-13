//
//  ContentView.swift
//  WordlTraveler
//
//  Created by Hicret Ay on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenheitValue: String = ""
    
    let numberFormatter: NumberFormatter = {
       let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func converToCelcius() -> String {
        
        if let value = Double(fahrenheitValue){
            let fahrenheit = Measurement<UnitTemperature>(
                value: value,
                unit: .fahrenheit)
            
            let celciusValue = fahrenheit.converted(to: .celsius)
            
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "?"
            
        }else{
            return "?"
        }
    }
    
    var body: some View {
        VStack{
            TextField("value",text: $fahrenheitValue)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("fahrenheit")
            Text("is actually").foregroundColor(.gray)
            Text(converToCelcius())
            Text("degress Celcius")
            Spacer() // kalan alanı doldurur
        }.foregroundColor(.orange)
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

