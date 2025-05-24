import SwiftUI

struct ContentView: View {
    let monkeys = MonkeyData.monkeys
    @State private var selectedMonkey: Monkey?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Pattern
                GeometryReader { geometry in
                    let columns = Int(geometry.size.width / 50)
                    let rows = Int(geometry.size.height / 50)
                    ForEach(0..<rows, id: \.self) { row in
                        ForEach(0..<columns, id: \.self) { column in
                            Text("🍌")
                                .opacity(0.1)
                                .rotationEffect(.degrees(Double.random(in: -20...20)))
                                .position(
                                    x: CGFloat(column) * 50 + 25,
                                    y: CGFloat(row) * 50 + 25
                                )
                        }
                    }
                }
                
                VStack(spacing: 0) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(height: 140)
                            .edgesIgnoringSafeArea(.top)
                        VStack(spacing: 6) {
                            Text("🐒 Monkey Gallery 🐒")
                                .font(.largeTitle).bold()
                                .foregroundColor(.white)
                            Text("Discover monkeys and their habitats!")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.85))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(monkeys) { monkey in
                                VStack(spacing: 8) {
                                    AsyncImage(url: URL(string: monkey.image)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    }
                                    Text(monkey.name)
                                        .font(.headline)
                                    Text(monkey.location)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(monkey.details)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .lineLimit(3)
                                        .multilineTextAlignment(.center)
                                    // Population indicator
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Population: \(monkey.population.formatted())")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        // Population bar
                                        GeometryReader { geometry in
                                            ZStack(alignment: .leading) {
                                                Rectangle()
                                                    .frame(width: geometry.size.width, height: 4)
                                                    .opacity(0.3)
                                                    .foregroundColor(.gray)
                                                Rectangle()
                                                    .frame(width: geometry.size.width * CGFloat(min(Double(monkey.population) / 30000.0, 1.0)), height: 4)
                                                    .foregroundColor(populationColor(count: monkey.population))
                                            }
                                            .cornerRadius(2)
                                        }
                                        .frame(height: 4)
                                    }
                                    .padding(.top, 4)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(UIColor.systemBackground))
                                        .shadow(color: Color.blue.opacity(0.2), radius: 8, x: 0, y: 4)
                                        .shadow(color: Color.purple.opacity(0.2), radius: 12, x: 0, y: 8)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.blue.opacity(0.2), .purple.opacity(0.2)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1
                                        )
                                )
                                .contentShape(Rectangle())  // Makes the entire area tappable
                                .onTapGesture {
                                    selectedMonkey = monkey
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(item: $selectedMonkey) { monkey in
                MonkeyDetailView(monkey: monkey)
            }
        }
    }
    
    private func populationColor(count: Int) -> Color {
        switch count {
        case ..<5000: return .red
        case 5000..<15000: return .orange
        case 15000..<25000: return .blue
        default: return .green
        }
    }
}

#Preview {
    ContentView()
}
