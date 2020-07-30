import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }.tag(1)
            
            Text("Second Tab")
                .font(.largeTitle)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tag(2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct NView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                })
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                })
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                })
            }
            .navigationBarTitle("Home")
            .navigationBarItems(leading: Text("Cancel"), trailing: Text("Done"))
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}
