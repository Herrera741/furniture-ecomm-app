//
//  ApplePayButton.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 1/1/25.
//

import SwiftUI
import PassKit

struct ApplePayButton: View {
    var buttonType: PKPaymentButtonType
    var action: () -> Void
    
    var body: some View {
        Representable(buttonType: buttonType, action: {})
            .padding(.top, 30)
            .frame(minWidth: 140, maxWidth: .infinity)
            .frame(height: 55)
    }
}

#Preview {
    ApplePayButton(buttonType: .checkout, action: {})
}

extension ApplePayButton {
    struct Representable: UIViewRepresentable {
        var buttonType: PKPaymentButtonType
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(buttonType: buttonType, action: action)
        }
        
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var buttonType: PKPaymentButtonType
        var action: () -> Void
        var button: PKPaymentButton
        
        init(buttonType: PKPaymentButtonType, action: @escaping () -> Void) {
            self.buttonType = buttonType
            self.action = action
            self.button = PKPaymentButton(paymentButtonType: buttonType, paymentButtonStyle: .automatic)
            super.init()
            
            self.button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender: Any) {
            action()
        }
    }
}
