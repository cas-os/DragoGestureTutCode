//
//  DragGesture2.swift
//  DragoGestureTutCode
//
//  Created by HAL-9001 on 11/05/2022.
//

import SwiftUI

struct DragGesture2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.86
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    print(".onEnded if :: \(currentDragOffsetY)")
                                    endingOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                    currentDragOffsetY = 0
                                } else {
                                    print(".onEnded else :: \(currentDragOffsetY)")
                                    //endingOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                }
                                
                            }
                            
                        }
                )
            
            VStack {
                Text("startingOffsetY ::\(startingOffsetY)")
                Text("currentDragOffsetY ::\(currentDragOffsetY)")
                Text("endingOffsetY ::\(endingOffsetY)")
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct DragGesture2_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture2()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding()
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "house.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. ")
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
