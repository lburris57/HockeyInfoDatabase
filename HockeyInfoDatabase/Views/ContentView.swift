//
//  ContentView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Neumorphic
import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            ScrollView
            {
                VStack(spacing: 25)
                {
                    HStack(spacing: 15)
                    {
                        Button(action: {})
                        {
                            Text("Capsule").fontWeight(.bold)
                        }
                        .softButtonStyle(Capsule())
                        
                        Button(action: {})
                        {
                            Text("RoundedRectangle").fontWeight(.bold)
                        }
                        .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    HStack(spacing: 15)
                    {
                        Button(action: {})
                        {
                            Image(systemName: "heart.fill")
                        }
                        .softButtonStyle(Circle())
                        
                        Button(action: {})
                        {
                            Text("Ellipse")
                                .fontWeight(.bold)
                                .frame(width: 150, height: 20)
                        }
                        .softButtonStyle(Ellipse())
                        
                        Button(action: {})
                        {
                            Image(systemName: "heart.fill")
                        }
                        .softButtonStyle(Circle(), mainColor: Color.red, textColor: Color.white, darkShadowColor: Color.Neumorphic.secondary, lightShadowColor: Color.red.opacity(0.15))
                    }
                    
                    Button(action: {})
                    {
                        Text("Custom Size")
                            .fontWeight(.bold)
                            .frame(width: 300, height: 20)
                    }
                    .softButtonStyle(Capsule(), padding: 15)
                    
                    HStack
                    {
                        Button(action: {})
                        {
                            Text("Padding").fontWeight(.bold)
                        }
                        .softButtonStyle(RoundedRectangle(cornerRadius: 20), padding: 10)
                    }
                    
                    Text("Pressed Effect").font(.headline).foregroundColor(Color.Neumorphic.secondary)
                    
                    HStack
                    {
                        Spacer()
                        
                        Button(action: {})
                        {
                            Text(".none").fontWeight(.bold)
                        }
                        .softButtonStyle(Capsule(), pressedEffect: .none)
                        
                        Spacer()
                        
                        Button(action: {})
                        {
                            Text(".flat").fontWeight(.bold)
                        }
                        .softButtonStyle(Capsule(), pressedEffect: .flat)
                        
                        Spacer()
                        
                        Button(action: {})
                        {
                            Text(".hard").fontWeight(.bold)
                        }
                        .softButtonStyle(Capsule(), pressedEffect: .hard)
                        
                        Spacer()
                    }
                    
                    Text("ContextMenu").font(.headline).foregroundColor(Color.Neumorphic.secondary)
                    
                    Button(action: {})
                    {
                        Text("Button").fontWeight(.bold)
                    }
                    .softButtonStyle(Capsule(), pressedEffect: .none)
                    .contentShape(Capsule())
                    .contextMenu(
                        ContextMenu(menuItems:
                        {
                            Text("Menu Item 1")
                            Text("Menu Item 2")
                        }
                        ))
                    .background(Capsule().fill(Color.Neumorphic.main).softOuterShadow()
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
