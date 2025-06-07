import SwiftUI

struct CafetariaView: View {
    let menuItems: [MenuItem] = [
        MenuItem(name: "Shawarma", price: "Rs. 250.00", imageName: "shawarma"),
        MenuItem(name: "Noodles", price: "Rs. 300.00", imageName: "noodles"),
        MenuItem(name: "Pasta", price: "Rs. 450.00", imageName: "pasta")
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // MARK: - Header with Image and Title
                ZStack(alignment: .topLeading) {
                    Image("cafeBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()

                    VStack(alignment: .leading, spacing: -30) {
                        Button(action: {
                            // Handle back
                        }) {
                            Text("")
                                .foregroundColor(.white)
                        }
                        .padding(.top, 150)
                        .padding(.leading)
                        .offset(x: 30)

                        Text("Cafeteria")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .padding(.bottom, 0)
                            .padding(.horizontal, 100)
                            .offset(x: 40)
                    }
                  

                    // MARK: - Crowd Level Card
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .listRowSeparatorLeading) {
                                Text("Crowd Level")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("LOW")
                                    .font(.title3)
                                    .foregroundColor(.green)
                                    .bold()
                            }
                            Image("crowdLevel") // Illustration asset
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 4)
                        .padding(.horizontal, 20)
                        .offset(y: 150)
                        .offset(x: 20)
                    }
                }
                .frame(height: 200)

                Spacer().frame(height: 220)

                // MARK: - Menu Header
                VStack(spacing: 20) {
                    Text("Today Menu")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Breakfast 8 AM to 12 PM\nLunch 12 PM to 4 PM")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom,40)

                // MARK: - Menu Scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(menuItems, id: \.name) { item in
                            VStack(spacing: 10) {
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(12)

                                Text(item.name)
                                    .font(.headline)

                                Text(item.price)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(width: 140)
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                            .shadow(radius: 1)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }

            // MARK: - Bottom Navigation
            
            VStack {
                HStack(spacing: 70) {
                    // Home Tab (stays here)
                    TabBarItem(iconName: "homeimage", isSelected: true)

                    // Location Tab
                    NavigationLink(destination: SearchMapView()) {
                        TabBarItem(iconName: "locationimage", isSelected: false)
                    }

                    // Bell Tab
                    NavigationLink(destination: NotificationView()) {
                        TabBarItem(iconName: "bellimage", isSelected: false)
                    }

                    // Profile Tab
                    NavigationLink(destination: ProfileView()) {
                        TabBarItem(iconName: "profileimage", isSelected: false)
                    }
                }
                .frame(height: 5)
                .padding(.horizontal, 40)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
            
         
        
        .edgesIgnoringSafeArea(.top)
    }
}

struct MenuItem {
    let name: String
    let price: String
    let imageName: String
}

struct TabBarItem4: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(isSelected ? .blue : .black)
            .frame(width: 28, height: 28)
    }
}

#Preview {
    CafetariaView()
}
