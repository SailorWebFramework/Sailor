import Sailor 
struct NotFoundPage: Page {
   

   var body: some Page {
       Div {
           Div("404")
           Div("Page not found")
           Button("Go to home")
               .onClick {
                    window.location.replace("http://localhost:8080/")
               }
    }
}
}

