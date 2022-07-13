//
//  Home.swift
//  pizza frenzy
//
//  Created by ASMI iOS Dev on 13/07/22.
//

import SwiftUI

struct Home: View {
    @State var SelectedPizza:Pizza = pizzas[0]
    @State var swipedirection:Alignment = .center
    @State var animatePizza:Bool = false
    var body: some View {
        VStack {
            HStack{
                Button{
                    
                }label: {
                    Image("menu")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    
                }
                Spacer()
                
                Button{
                    
                }label: {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
            }
            .overlay(
                Text("EATPIZZA")
                    .fontWeight(.black)
                    .font(.system(size: 40))
                
            )
            Text("Select Your Pizza")
                .opacity(0.75)
                .foregroundColor(.gray)
            
            AnimatedSlider()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(20)
    }
    
    @ViewBuilder
        func AnimatedSlider() -> some View {
            GeometryReader { proxy in
                let size = proxy.size
                LazyHStack(spacing:15){
                        VStack(spacing:10) {
                            Text(SelectedPizza.pizzaTitle)
                                .font(.largeTitle.bold())
                                
                            Text(SelectedPizza.description)
                                .font(.callout)
                                .padding(.top,10)
                                .padding(.horizontal)
                                .foregroundColor(.white .opacity(0.8))
                                .multilineTextAlignment(.center)
                        .frame(width: size.width, height: size.height, alignment: .top)
                    }
                }
                pizzaView()
                    .padding(.top,120)
            }
            .padding(.horizontal,-12)
            .padding(.top,30)
        }
    
    @ViewBuilder
    func pizzaView()-> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack{
               // Text("\(size.width/2)")
                if pizzas.first?.id != SelectedPizza.id{
                    Arcshape()
                        .trim(from: 0,to: 0.3)
                        .stroke(Color.gray, lineWidth: 1)
                        .offset(y:200)
                    Image(systemName: "chevron.left")
                        .rotationEffect(.init(degrees: -30))
                        .offset(x:-(size.width/2),y:-38)
                }
                if pizzas.last?.id != SelectedPizza.id{
                    Arcshape()
                        .trim(from: 0.7,to: 1)
                        .stroke(Color.gray, lineWidth: 1)
                        .offset(y:200)
                    Image(systemName: "chevron.right")
                        .rotationEffect(.init(degrees: 30))
                        .offset(x:size.width/2,y:-38)
                }
                
                    
                ZStack(alignment: .center){
                    Text(attributedString(value:SelectedPizza.price))
                        .font(.largeTitle.bold())
                        .frame(width: size.width, height: size.height, alignment: .center)
                        //.rec

                }
                 
                .offset(y:size.height-570)
                
                Image(SelectedPizza.pizzaImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height, alignment: .top)
                    .rotationEffect(.init(degrees: animatePizza ? (swipedirection == .leading ? -360: 360) : 0))
                    .offset(y: size.height/2)
                    //.scaleEffect(1.05,anchor: .top)
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                let index = getIndex(pizza: SelectedPizza)
                                let translation = value.translation.width
                                print(translation)
                                
                                if animatePizza{return}
                                
                                if translation > 0 && translation < 50 &&
                                    index > 0
                                {
                                    //Right swipe
                                    swipedirection = .trailing
                                    handleSwipe()
                                }
                                if translation < 0 && translation > -50 &&
                                    index != pizzas.count-1
                                {
                                    //left swipe
                                    swipedirection = .leading
                                    handleSwipe()
                                }
                            })
                    )
//                    .background(Image("powder")
//                        .frame(width: size.width, alignment: .top)
//                        .aspectRatio(contentMode: .fill))

            }
            

        }
        .padding(.top)

    }
    
    
    func attributedString(value:String)->AttributedString {
        var attrString = AttributedString(stringLiteral: value)
        if let range = attrString.range(of: "$"){
            attrString[range].font = .system(.callout)
        }
        return attrString
    }
    
    func handleSwipe(){
        let index = getIndex(pizza: SelectedPizza)
        if swipedirection == .leading{
            print("leftswipe")
            withAnimation(.easeInOut(duration: 0.5)){
               SelectedPizza = pizzas[index+1]
                animatePizza = true
            }
        }
        if swipedirection == .trailing{
            print("rightswipe")
            withAnimation(.easeInOut(duration: 0.5)){
                SelectedPizza = pizzas[index-1]
                animatePizza = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
            animatePizza = false
        }
    }
    
    func getIndex(pizza:Pizza)->Int{
        return pizzas.firstIndex{p in
            p.id == pizza.id
        } ?? 0
    }
    
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
