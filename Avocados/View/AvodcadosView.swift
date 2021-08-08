//
//  AvodcadosView.swift
//  Avocados
//
//  Created by Umair Riaz on 06/08/2021.
//

import SwiftUI

struct AvodcadosView: View {
    
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            Text("Avocado")
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundColor(.white)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
            Text("""
Creamy, green, and full of nutrients!
Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            Spacer()
        }
        .onAppear(perform: {
            pulsateAnimation.toggle()
        })
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct AvodcadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvodcadosView()
            .environment(\.colorScheme, .light)
    }
}
