//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Sailboat
import JavaScriptKit

public typealias Page = Sailboat.Page
public typealias State = Sailboat.State
public typealias Binding = Sailboat.Binding
public typealias PageBuilder = Sailboat.PageBuilder

//public typealias Navigator<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<WebEnvironment<EnvRoutes>, EnvValue>
//public typealias Environment<Value> = Sailboat.Environment<WebEnvironment<NoRoutes>, Value>
public typealias Environment<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<WebEnvironment<EnvRoutes>, EnvValue>

public typealias Routes = Sailboat.Routes
public typealias Navigation<MyRoutes: Routes> = Sailboat.Navigation<MyRoutes>

public typealias BidirectionalDictionary = Sailboat.BidirectionalDictionary



public typealias List = Sailboat.List

