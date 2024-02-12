//
//  ContentView.swift
//  MarketFlash
//
//  Created by Vinicius Wessner on 12/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var changeScreen = false
    
    var body: some View {

        NavigationStack {
            VStack(spacing: 50) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame( width: 300, height: 300)
                Text("Suas compras diretamente\n em sua porta")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                Text("Oferemos frutas e vegetais frescos com uma velocidade de entrega incoparável")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Button(){
                    changeScreen = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                        Text("Realizar pedido")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 70)
                    .foregroundColor(.green)
            }
            .navigationDestination(isPresented: $changeScreen) {
                Shop()
            }
        }
    }
}

#Preview {
    ContentView()
}
