//
//  SWSwiftUIDebugTool.swift
//  SWSwiftUIDebugTool
//
//  Created by Sunset Wan on 5/12/2022.
//

#if canImport(SwiftUI)
import SwiftUI
extension View {
    /// Print method
    public func swPrint(_ value: Any) -> Self {
        swDebugAction {
            Swift.print(value)
        }
    }

    /// Exec custom action for debug
    public func swDebugAction(_ closure: () -> Void) -> Self {
        #if DEBUG
        closure()
        #endif
        return self
    }

    // View modifiers
    public func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
        #if DEBUG
        return modifier(self)
        #else
        return self
        #endif
    }

    /// Add boder for ui debug
    /// - Parameters:
    ///   - color: default value is red
    ///   - width: default value is 1
    public func swDebugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
        debugModifier {
            $0.border(color, width: width)
        }
    }

    /// Add background for ui debug
    /// - Parameter color: default value is red
    public func swDebugBackground(_ color: Color = .red) -> some View {
        debugModifier {
            $0.background(color)
        }
    }
}
#endif

