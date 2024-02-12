//
//  Cart.swift
//  MarketFlash
//
//  Created by Vinicius Wessner on 12/02/24.
//

import SwiftUI

struct Cart: View {
    
    @State var totalPrice = 0.00
    
    var body: some View {
        VStack{
            Text("Meu Carrinho")
                .font(.system(size: 34, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List {
                ForEach(0..<cartItems.endIndex, id: \.self) {item in
                    HStack{
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40, height: 40)
                       
                        VStack(spacing: 5) {
                            Text(cartItems[item][1] as! String)
                            
                            Text("R$\(String(format: "%.2f", cartItems[item][2] as! Double))")
                                .foregroundColor(.gray)
                                
                        }
                    }
                }.onDelete{ indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    self.calculateTotalPrice()
                }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .frame(width: 350, height: 100)
                VStack {
                    Text("Valor Total")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    
                    Text("R$\(String(format: "%.2f", totalPrice))")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                }
                
                Button() {
                    
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                            .foregroundColor(.white)
                        
                        Text("Pagamento >")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
        }.onAppear(perform: {
            self.calculateTotalPrice()
        })
    }
    
    func calculateTotalPrice() {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
}

#Preview {
    Cart()
}
