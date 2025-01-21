//
//  ContentView.swift
//  Crypto App
//
//  Created by rose matheo on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    let now = Date()
    @State private var isEuro: Bool = false
    @State private var prices: [Prices] = [
        Prices(crypto: "BIT", imageName: "bitcoin", price: 51),
        Prices(crypto: "ETH", imageName: "ethereum", price: 21),
        Prices(crypto: "XRP", imageName: "ripple", price: 6),
        Prices(crypto: "XLM", imageName: "stellar", price: 11)
    ]
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                HStack(spacing:20){
                    Text("Crypto App")
                        .foregroundStyle(Color(red: 52/255, green: 255/255, blue: 197/255))
                        .font(.largeTitle).bold()
                    Button{
                        reloadPrice()
                    }label: {
                        Image(systemName:"arrow.clockwise.circle")
                            .font(.title).bold()
                            .foregroundStyle(Color(red: 52/255, green: 255/255, blue: 197/255))
                    }
                    
                    
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "calendar.circle.fill")
                        .font(.system(size:30))
                        .foregroundStyle(Color(red: 52/255, green: 255/255, blue: 197/255))
                    Text(now, format:
                            .dateTime.year().month().day())
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                HStack(spacing:20){
                    cryptoView(price: prices[0], isEuro: isEuro)
                    cryptoView(price: prices[1], isEuro: isEuro)
                    cryptoView(price: prices[2], isEuro: isEuro)
                    cryptoView(price: prices[3], isEuro: isEuro)
                }
                
                Spacer()
                
                Button{
                    isEuro.toggle()
                }label: {
                    Text("Convert to €")
                        .frame(width: 280, height: 50)
                        .background(Color(red: 52/255, green: 255/255, blue: 197/255))
                        .font(.title2).bold()
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
            }
        }
    }
    
    func reloadPrice(){
        for i in 0..<prices.count {
            prices[i].price += 1
        }
    }
}

struct cryptoView: View{
    
    var price: Prices
    var isEuro: Bool
    
    var body: some View{
        VStack{
            Text(price.crypto)
                .font(.title2)
                .foregroundStyle(.white)
            Image(price.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            isEuro ? Text("€\(0.97 * price.price)k")
                .font(.title2)
                .foregroundStyle(.white)
            :   Text("$\(price.price)k")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
        
}

#Preview {
    ContentView()
}
