import SwiftUI

struct DashboardView: View {
    // Adjustable constants for easier tweaks
    let boxSize: CGFloat = 150
    let gridSpacing: CGFloat = 30

    var body: some View {
        ZStack {
            // Background Image
            Image("backgroundImage3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // MARK: - Top Greeting and Profile
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

                // MARK: - Dashboard Title
                Text("Dashboard")
                    .font(.custom("Futura-Bold", size: 48))
                    .foregroundColor(.white)
                    .padding(.top, 30)

                // MARK: - Grid Section
                Spacer()

                LazyVGrid(columns: [GridItem(), GridItem()], spacing: gridSpacing) {
                    DashboardButton(imageName: "map", label: "Map", size: boxSize)
                    DashboardButton(imageName: "library", label: "Library", size: boxSize)
                    DashboardButton(imageName: "cafe", label: "Cafe", size: boxSize)
                    DashboardButton(imageName: "schedule", label: "Schdule", size: boxSize) // Typo preserved
                }
                .padding(.horizontal, 35)

                Spacer()
            }
            // MARK: - Bottom Tab Bar
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 75) {
                    TabBarItem(systemImage: "house.fill", isSelected: true)
                    TabBarItem(systemImage: "location.north.line", isSelected: false)
                    TabBarItem(systemImage: "bell", isSelected: false)
                    TabBarItem(systemImage: "person", isSelected: false)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.horizontal, 16)
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
    let systemImage: String
    let isSelected: Bool

    var body: some View {
        Image(systemName: systemImage)
            .font(.system(size: 24))
            .foregroundColor(isSelected ? .blue : .black)
    }
}

#Preview {
    DashboardView()
}
