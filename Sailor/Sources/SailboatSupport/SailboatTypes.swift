//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Sailboat

public typealias Page = Sailboat.Page
public typealias State = Sailboat.State
public typealias Binding = Sailboat.Binding
//public typealias Navigator<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<SailorEnvironment<EnvRoutes>, EnvValue>
//public typealias Environment<Value> = Sailboat.Environment<SailorEnvironment<NoRoutes>, Value>
public typealias Environment<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<SailorEnvironment<EnvRoutes>, EnvValue>

public typealias Routes = Sailboat.Routes
public typealias Navigation<MyRoutes: Routes> = Sailboat.Navigation<MyRoutes>

public typealias BidirectionalDictionary = Sailboat.BidirectionalDictionary
