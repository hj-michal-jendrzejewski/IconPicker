//
//  Extensions.swift
//  PPL
//
//  Created by Macbook Pro on 11/10/2020.
//

import Foundation
import SwiftUI

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}



struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content

    @State private var collapsed: Bool = true

    var body: some View {
        VStack {


            VStack {
                Spacer()

                self.content()
//                    .padding([.top], self.collapsed ? 40 : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 60 : .none, alignment: .top)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)

            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        Spacer()
                        Text(self.collapsed ? "Show more" : "Show less")
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
    }
}


extension StringProtocol { // for Swift 4 you need to add the constrain `where Index == String.Index`
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}

extension String
{
    func replacingLastOccurrenceOfString(_ searchString: String,
            with replacementString: String,
            caseInsensitive: Bool = true) -> String
    {
        let options: String.CompareOptions
        if caseInsensitive {
            options = [.backwards, .caseInsensitive]
        } else {
            options = [.backwards]
        }

        if let range = self.range(of: searchString,
                options: options,
                range: nil,
                locale: nil) {

            return self.replacingCharacters(in: range, with: replacementString)
        }
        return self
    }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
      }

}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

class DispatchWorkHolder {
    var work: DispatchWorkItem?
}

class MyRange: Hashable, Equatable {
    public var hashValue: Int {
        get {
            return (self.range.lowerBound + self.range.upperBound).hashValue
        }
    }

    var range: Range<Double>!

    public static func ==(_ lhs: MyRange, _ rhs: MyRange) -> Bool {
        return lhs.range == rhs.range
    }

    init(range: Range<Double>) {
        self.range = range
    }
}


extension Dictionary where Key: MyRange, Value: ExpressibleByStringLiteral {
    internal subscript(index: Double) -> [String] {
        return self.filter({$0.key.range.contains(Double(index))}).map({$0.value as! String})
    }
}

// the below extension allows to store arrays in AppStorage
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}


//allows to get a character in a string by just using [charIndex] - "abcde"[0] returns "a"

private struct IndexInfo<Index, Element, ID: Hashable>: Hashable {
    let index: Index
    let id: KeyPath<Element, ID>
    let element: Element

    var elementID: ID {
        self.element[keyPath: self.id]
    }

    static func == (_ lhs: IndexInfo, _ rhs: IndexInfo) -> Bool {
        lhs.elementID == rhs.elementID
    }

    func hash(into hasher: inout Hasher) {
        self.elementID.hash(into: &hasher)
    }
}



//returns scroll offset number
private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}


//
//extension View {
//    func tooltip(_ tip: String) -> some View {
//        background(GeometryReader { childGeometry in
//            TooltipView(tip, geometry: childGeometry) {
//                self
//            }
//        })
//    }
//}

//private struct TooltipView<Content>: View where Content: View {
//    let content: () -> Content
//    let tip: String
//    let geometry: GeometryProxy
//
//    init(_ tip: String, geometry: GeometryProxy, @ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//        self.tip = tip
//        self.geometry = geometry
//    }
//
//    var body: some View {
//        Tooltip(tip, content: content)
//            .frame(width: geometry.size.width, height: geometry.size.height)
//    }
//}
//
//private struct Tooltip<Content: View>: NSViewRepresentable {
//    typealias NSViewType = NSHostingView<Content>
//
//    init(_ text: String?, @ViewBuilder content: () -> Content) {
//        self.text = text
//        self.content = content()
//    }
//
//    let text: String?
//    let content: Content
//
//    func makeNSView(context _: Context) -> NSHostingView<Content> {
//        NSViewType(rootView: content)
//    }
//
//    func updateNSView(_ nsView: NSHostingView<Content>, context _: Context) {
//        nsView.rootView = content
//        nsView.toolTip = text
//    }
//}
//
//
//
