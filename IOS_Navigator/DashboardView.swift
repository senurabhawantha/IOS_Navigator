import SwiftUI

struct DashboardView: View {
    
    let boxSize: CGFloat = 150
    let gridSpacing: CGFloat = 30

    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("backgroundImage3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    
                    HStack {
                        Text("Hi, Fernando 👋!")
                            .font(.custom("Futura", size: 30))
                            .foregroundColor(.white)

                        Spacer()

                        Image("profilepicture")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 70)

                    
                    Text("Dashboard")
                        .font(.custom("Futura-Bold", size: 48))
                        .foregroundColor(.white)
                        .padding(.top, 30)

                    Spacer()

                    
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: gridSpacing) {
                        NavigationLink(destination: SearchMapView()) {
                            DashboardButton(imageName: "map", label: "Map", size: boxSize)
                        }
                        NavigationLink(destination: LibraryView()) {
                            DashboardButton(imageName: "library", label: "Library", size: boxSize)
                        }
                        NavigationLink(destination: CafetariaView()) {
                            DashboardButton(imageName: "cafe", label: "Cafe", size: boxSize)
                        }
                        NavigationLink(destination: ScheduleView()) {
                            DashboardButton(imageName: "schedule", label: "Schedule", size: boxSize)
                        }
                    }
                    .padding(.horizontal, 35)

                    Spacer()
                }

                
                .safeAreaInset(edge: .bottom) {
                    VStack {
                        HStack(spacing: 70) {
                            
                            TabBarItem(iconName: "homeimage", isSelected: true)

                            
                            NavigationLink(destination: SearchMapView()) {
                                TabBarItem(iconName: "locationimage", isSelected: false)
                            }

                            
                            NavigationLink(destination: NotificationView()) {
                                TabBarItem(iconName: "bellimage", isSelected: false)
                            }

                            
                            NavigationLink(destination: ProfileView()) {
                                TabBarItem(iconName: "profileimage", isSelected: false)
                            }
                        }
                        .frame(height: 85)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                }
            }
        }
    }
}

struct DashboardButton: View {
    let imageName: String
    let label: String
    let size: CGFloat

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: size * 0.4, height: size * 0.4)
                .padding(.bottom, 8)

            Text(label)
                .font(.custom("Futura", size: 18))
                .foregroundColor(.black)
        }
        .frame(width: size, height: size)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct TabBarItem: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(isSelected ? .blue : .black)
            .frame(width: 30, height: 30)
    }
}

#Preview {
    DashboardView()
}
