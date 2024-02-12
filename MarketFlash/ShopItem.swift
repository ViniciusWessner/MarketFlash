//
//  ShopItem.swift
//  MarketFlash
//
//  Created by Vinicius Wessner on 12/02/24.
//

import SwiftUI

struct ShopItem: View {
    
    @State private var addItemAlert = false
    
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    var selfIndex: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .opacity(0.25)
                .frame(width: 170, height: 230)
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(title)
                Button() {
                    //adicionando item no carrinho
                    cartItems.append(shopItems[selfIndex])
                    //fazer aletta
                        addItemAlert = true
                }label: {
                    Text("R$\(String(format: "%.2f", price))")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(color)
                }
                
                .alert(isPresented: $addItemAlert) {
                    Alert(
                        title: Text("Item adicionado ao\n seu carrinho"),
                        message: Text("")
                    )
                }
            }
        }
    }
}

#Preview {
    ShopItem(imageName: "avocado", title: "Abacate", price: 5.00, color: Color.green, selfIndex: 0)
}
