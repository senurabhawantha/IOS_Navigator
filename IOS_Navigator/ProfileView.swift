//
//  ProfileView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-06.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack(alignment: .topTrailing) {
                Color.cyan
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)

                VStack(spacing: 12) {
                    Spacer().frame(height: 60)

                    Text("Profile")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    
                    Image("profilepicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))

                    Text("Fernando")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Text("jd@gmail.com")
                        .foregroundColor(.black.opacity(0.9))
                }

                
                Button(action: {
                    
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding(.top, 60)
                .padding(.trailing, 20)
            }

            
            VStack(spacing: 20) {
                ButtonRow(title: "Settings and Privacy")

                Text("Settings")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                VStack(spacing: 16) {
                    ButtonRow(title: "Notification")
                    ButtonRow(title: "Schedule")
                    ButtonRow(title: "Logout")
                }
            }
            .padding()

            Spacer()

            
            VStack {
                HStack(spacing: 70) {
                    
                    NavigationLink(destination: DashboardView()) {
                        TabBarItem(iconName: "homeblack", isSelected: false)
                    }
                    
                    NavigationLink(destination: SearchMapView()) {
                        TabBarItem(iconName: "locationimage", isSelected: false)
                    }

                    
                    NavigationLink(destination: NotificationView()) {
                        TabBarItem(iconName: "bellimage", isSelected: false)
                    }

                    
                    NavigationLink(destination: ProfileView()) {
                        TabBarItem(iconName: "profileblue", isSelected: true)
                    }
                }
                .frame(height: 45)
                .padding(.horizontal, 40)
                .padding(.top, 40)
                .padding(.bottom, 10)
            }
            
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}

struct ButtonRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

struct TabBarItem6: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(isSelected ? .blue : .black)
    }
}

#Preview {
    ProfileView()
}

