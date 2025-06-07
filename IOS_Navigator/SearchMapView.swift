import SwiftUI

struct SearchMapView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Background
            Image("searchMapBackground") // Replace with your background image name
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .background(Color.black)

            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Search Bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)

                        Text("C2007 Hall")
                            .foregroundColor(.black)

                        Spacer()

                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(16)

                    Button("Cancel") {
                        // Handle cancel
                    }
                    .foregroundColor(.blue)
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)

                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // MARK: - Lecture Halls
                        Group {
                            SectionTitle("Lecture Halls")
                            SearchCard(iconName: "building", text: "Lecture Hall C2007")
                            SearchCard(iconName: "building", text: "Lecture Hall C2008")
                            SearchCard(iconName: "building", text: "Lecture Hall C2009")
                        }

                        // MARK: - Offices
                        Group {
                            SectionTitle("Offices")
                            SearchCard(iconName: "chair", text: "Administration Office")
                            SearchCard(iconName: "chair", text: "Course Director’s Office")
                            SearchCard(iconName: "chair", text: "Admission Office")
                        }

                        // MARK: - Others
                        Group {
                            SectionTitle("Others")
                            SearchCard(iconName: "fork.knife", text: "Cafeteria")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 120)
                }
            }

            // MARK: - Bottom Navigation Bar
            VStack {
                HStack(spacing: 60) {
                    TabBarItem(iconName: "homeimage", isSelected: false)
                    TabBarItem(iconName: "locationblue", isSelected: true)
                    TabBarItem(iconName: "bellimage", isSelected: false)
                    TabBarItem(iconName: "profileimage", isSelected: false)
                }
                .frame(height: 75)
                .padding(.horizontal, 40)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}

struct SectionTitle: View {
    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.black)
    }
}

struct SearchCard: View {
    let iconName: String
    let text: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.black)

            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 16))

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
    }
}

struct TabBarItem2: View {
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
    SearchMapView()
}
