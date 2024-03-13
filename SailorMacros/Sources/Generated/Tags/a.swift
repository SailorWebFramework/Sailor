//
//  a.swift
//
//
//  Created by Joshua Davis on 3/12/24.
//

import SwiftSyntax
import SwiftSyntaxMacros

//public struct FourCharacterCode: ExpressionMacro {
//    public static func expansion(
//        of node: some FreestandingMacroExpansionSyntax,
//        in context: some MacroExpansionContext
//    ) throws -> ExprSyntax {
//        guard let argument = node.argumentList.first?.expression,
//              let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
//              segments.count == 1,
//              case .stringSegment(let literalSegment)? = segments.first
//        else {
//            fatalError("")
////            throw CustomError.message("Need a static string")
//        }
//
//
//        let string = literalSegment.content.text
//        guard let result = fourCharacterCode(for: string) else {
//            fatalError("")
//        }
//
//
//        return "\(raw: result) as UInt32"
//    }
//}
