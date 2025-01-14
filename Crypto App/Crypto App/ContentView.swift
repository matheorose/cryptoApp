//
//  ContentView.swift
//  Crypto App
//
//  Created by rose matheo on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack(spacing:20){
                    Text("Crypto App")
                        .foregroundStyle(.white)
                        .font(.largeTitle).bold()
                    Image(systemName:"arrow.clockwise.circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                    
                }
                
            }
        }
    }
}

struct cryptoView{
    
    var crypto: String
    var imageName: String
    var prix: Int
    
    var body: some View{
        VStack{
            Text(crypto)
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
        
}

#Preview {
    ContentView()
}
