//
//  NeumorphicButtonStyle.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle
{
    func makeBody(configuration: Configuration) -> some View
    {
        configuration.label.background(
            
        Group
        {
            if configuration.isPressed
            {
                withAnimation
                {
                    Capsule()
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 3, y: 3)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: -2, y: -2)
                        .clipShape(Capsule())
                        .scaleEffect(0.95)
                }
            }
            else
            {
                withAnimation
                {
                    Capsule()
                        .fill(Color.blue)
                        .shadow(color: Color.blue.opacity(0.2), radius: 2, x: 2, y: 2)
                        .shadow(color: Color.blue.opacity(0.7), radius: 2, x: -2, y: -2)
                }
            }
        })
    }
}

struct NeumorphicButtonStyle_Previews: PreviewProvider
{
    static var previews: some View
    {
        VStack()
        {
            Button("    Display Player Statistics    ")
            {
                
            }
            .buttonStyle(NeumorphicButtonStyle()).foregroundColor(.white).padding()
            
        }
    }
}
