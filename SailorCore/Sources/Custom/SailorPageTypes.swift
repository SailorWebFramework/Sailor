//
//  ElementTypes.swift
//
//
//  Created by Joshua Davis on 3/18/24.
//

import Sailboat

/// This element can be placed in the head of the component
protocol HeadElement: Element, HeadPage {} // HeadElement : Element

///
public protocol HeadPage: Sailboat.Page {} // HeadElement : Element

///
protocol BodyElement: Element, BodyPage {}

/// This element can be placed in the body
public protocol BodyPage: Sailboat.Page {} // BodyElement : Element

///
//extension MyPage: BodyPage where MyPage == any Page { }

