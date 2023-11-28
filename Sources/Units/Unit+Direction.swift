




extension Unit {
    public enum Direction: String, CSSValue, AttributeValue, Equatable {
        public var description: String {
            self.rawValue
        }
        
        case ltr, rtl

    }
    
}
