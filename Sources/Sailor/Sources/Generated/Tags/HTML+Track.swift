// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Track.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The track element allows authors to specify explicit external timed text tracks for media elements.
    public struct Track: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "track" }

        /// attributes associated with this type
        @_spi(Private) public var attributes: [String: () -> any AttributeValue]

        /// events associated with this type
        @_spi(Private) public var events: [String: (EventResult) -> Void]

        /// content that is contained by this html element
        @_spi(Private) public var content: () -> any Fragment

        /// renderer that is used to render this element
        @_spi(Private) public var renderer: any Renderable

        @_spi(Private)
        public var body: Never {
            .error()
        }
        
        internal init(bodyValue: (() -> any Fragment)?) {
            self.attributes = [:]
            self.events = [:]
            self.content = bodyValue ?? { List() }
            #if os(WASI)
            self.renderer = JSNode(named: Self.name)
            #else
            self.renderer = EmptyRenderer()
            #endif
        }

        public init() {  
            self.init(bodyValue: nil)
        }


    }
}
// MARK: - Attributes
public extension HTML.Track {
    ///Specifies that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate.
    func `default`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "default", value: { value().description }))
    }

    ///Specifies the kind of text track.
    func `kind`(_ value: @autoclosure @escaping () -> Unit.TextTrackKind) -> Self {
        attribute(.init(name: "kind", value: { value().description }))
    }

    ///Specifies a user-readable title of the text track.
    func `label`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "label", value: { value().description }))
    }

    ///The URL of the track file.
    func `src`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///Specifies the language of the track text data.
    func `srclang`(_ value: @autoclosure @escaping () -> Unit.Language) -> Self {
        attribute(.init(name: "srclang", value: { value().description }))
    }

}