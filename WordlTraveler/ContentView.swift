//
//  ContentView.swift
//  WordlTraveler
//
//  Created by Hicret Ay on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenheitValue: String = ""
    
    @State var isVisible = false
    
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
            TextField("COVERSION_TEXT_FIELD_PLACEHOLDER",text: $fahrenheitValue)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray)
            Text(converToCelcius())
            Text("CONVERSION_DEGRESS_CELSIUS")
            Spacer() // kalan alanı doldurur
        }.foregroundColor(.orange)
            .font(.title)
            .opacity(isVisible ? 1.0 : 0.0)
            .offset(x:0,y: isVisible ? 0 : 20)
            .animation(.easeIn(duration: 2.0),value: isVisible)
            .onAppear{
                self.isVisible = true
            }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

