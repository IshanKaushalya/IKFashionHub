import SwiftUI

struct CartIcon: View {
    var numberOfProducts: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)

            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}
struct CartIconPreviews : PreviewProvider{
    static var previews: some View{
        CartIcon(numberOfProducts: 1)
    }
}
