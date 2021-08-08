//
//  ContentView.swift
//  Avocados
//
//  Created by Umair Riaz on 05/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    var headers: [Header]
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(headers) {header in
                        HeaderView(header: header)
                    }
                })
                }
                
                //Facts
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60){
                        ForEach(facts){ item in
                            FactsView(fact: item)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
               
                
                //DISHES View
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                DishesView()
                    .frame(maxWidth: 640)
                
                //Recipies
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                VStack(alignment: .center, spacing: 20){
                    ForEach(recipes){ item in
                        RecipeCardView(recipe: item)
                            .padding(.horizontal)
                    }
                }
                //Footer
                VStack(alignment: .center, spacing: 20){
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    Text("Everything you wanted to know about Avocados but you were to afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        }
    }
}

struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData)
            .preferredColorScheme(.light)
    }
}
