//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Umair Riaz on 08/08/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var recipe : Recipe
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                Group{
                    //Title
                    Text(recipe.title)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenMedium"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    //Rating
                    RecipeRatingView(recipe: recipe)
                    
                    //Cooking
                    RecipeCookingView(recipe: recipe)
                    
                    //Ingredients
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    VStack(alignment: .leading, spacing: 5){
                        ForEach(recipe.ingredients, id: \.self) {item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    //Instructions
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    ForEach(recipe.instructions, id: \.self) {item in
                        VStack(alignment: .center, spacing: 5){
                            
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                            
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack{
                Spacer()
                VStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(self.pulsate ? 1.2 :0.8, anchor: .center )
                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
            
        )
        .onAppear(perform: {
            self.pulsate.toggle()
        })
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
