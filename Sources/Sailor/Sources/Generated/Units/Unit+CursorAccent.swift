// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+CursorAccent.swift
//  

extension Unit {
    public struct CursorAccent: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The cursor is automatically determined based on the context.
        public static var `auto`: Self {
            return .init("auto")
        }

        ///The default cursor.
        public static var `default`: Self {
            return .init("default")
        }

        ///No cursor is rendered.
        public static var `none`: Self {
            return .init("none")
        }

        ///A context menu is available.
        public static var `contextMenu`: Self {
            return .init("context-menu")
        }

        ///Help is available.
        public static var `help`: Self {
            return .init("help")
        }

        ///The cursor is a pointer indicating a link.
        public static var `pointer`: Self {
            return .init("pointer")
        }

        ///The program is busy in the background but the user can still interact.
        public static var `progress`: Self {
            return .init("progress")
        }

        ///The program is busy and the user cannot interact.
        public static var `wait`: Self {
            return .init("wait")
        }

        ///The cursor indicates a cell or table.
        public static var `cell`: Self {
            return .init("cell")
        }

        ///The cursor is a crosshair.
        public static var `crosshair`: Self {
            return .init("crosshair")
        }

        ///The cursor indicates text.
        public static var `text`: Self {
            return .init("text")
        }

        ///The cursor indicates vertical text.
        public static var `verticalText`: Self {
            return .init("vertical-text")
        }

        ///The cursor indicates an alias or shortcut.
        public static var `alias`: Self {
            return .init("alias")
        }

        ///The cursor indicates something is to be copied.
        public static var `copy`: Self {
            return .init("copy")
        }

        ///The cursor indicates something is to be moved.
        public static var `move`: Self {
            return .init("move")
        }

        ///The cursor indicates that the dragged item cannot be dropped here.
        public static var `noDrop`: Self {
            return .init("no-drop")
        }

        ///The cursor indicates that the action is not allowed.
        public static var `notAllowed`: Self {
            return .init("not-allowed")
        }

        ///The cursor indicates something can be grabbed.
        public static var `grab`: Self {
            return .init("grab")
        }

        ///The cursor indicates something is being grabbed.
        public static var `grabbing`: Self {
            return .init("grabbing")
        }

        ///The cursor indicates that an edge is to be moved east.
        public static var `eResize`: Self {
            return .init("e-resize")
        }

        ///The cursor indicates that an edge is to be moved north.
        public static var `nResize`: Self {
            return .init("n-resize")
        }

        ///The cursor indicates that an edge is to be moved northeast.
        public static var `neResize`: Self {
            return .init("ne-resize")
        }

        ///The cursor indicates that an edge is to be moved northwest.
        public static var `nwResize`: Self {
            return .init("nw-resize")
        }

        ///The cursor indicates that an edge is to be moved south.
        public static var `sResize`: Self {
            return .init("s-resize")
        }

        ///The cursor indicates that an edge is to be moved southeast.
        public static var `seResize`: Self {
            return .init("se-resize")
        }

        ///The cursor indicates that an edge is to be moved southwest.
        public static var `swResize`: Self {
            return .init("sw-resize")
        }

        ///The cursor indicates that an edge is to be moved west.
        public static var `wResize`: Self {
            return .init("w-resize")
        }

        ///The cursor indicates that an edge is to be moved east or west.
        public static var `ewResize`: Self {
            return .init("ew-resize")
        }

        ///The cursor indicates that an edge is to be moved north or south.
        public static var `nsResize`: Self {
            return .init("ns-resize")
        }

        ///The cursor indicates that an edge is to be moved northeast or southwest.
        public static var `neswResize`: Self {
            return .init("nesw-resize")
        }

        ///The cursor indicates that an edge is to be moved northwest or southeast.
        public static var `nwseResize`: Self {
            return .init("nwse-resize")
        }

        ///The cursor indicates that a column is to be resized.
        public static var `colResize`: Self {
            return .init("col-resize")
        }

        ///The cursor indicates that a row is to be resized.
        public static var `rowResize`: Self {
            return .init("row-resize")
        }

        ///The cursor indicates that something can be scrolled in any direction.
        public static var `allScroll`: Self {
            return .init("all-scroll")
        }

        ///The cursor indicates that something can be zoomed in.
        public static var `zoomIn`: Self {
            return .init("zoom-in")
        }

        ///The cursor indicates that something can be zoomed out.
        public static var `zoomOut`: Self {
            return .init("zoom-out")
        }


    }
}
