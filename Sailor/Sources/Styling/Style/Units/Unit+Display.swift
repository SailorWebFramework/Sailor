
extension Unit {
    public enum Display: String, StyleValue, Equatable {
        public var description: String {
            self.rawValue
        }
        
        case inline,
             block,
             contents,
             flex,
             grid,
             inlineBlock = "inline-block",
             inlineFlex = "inline-flex",
             inlineGrid = "inline-grid",
             inlineTable = "inline-table",
             listItem = "inline-item",
             runIn = "run-in",
             table,
             tableCaption = "table-caption",
             tableColumnGroup = "table-column-group",
             tableHeaderGroup = "table-header-group",
             tableFooterGroup = "table-footer-group",
             tableRowGroup = "table-row-group",
             tableCell = "table-cell",
             tableColumn = "table-column",
             tableRow = "table-row",
             none
    }
    
}
