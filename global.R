

# loading packages --------------------------------------------------------

  library("shiny")
  library("rclipboard")
  library("shinyjs")
  library("shinydashboard")
  library("htmlwidgets")
  library("shinyWidgets")
  library("shinyBS")

# function to clean up text output ----------------------------------------

  show.text = function(preface, input, type){
    
    if(type == "mc") {  # length(input) != 0
      combinput = sort(input)
      combinput = paste(combinput, collapse = " + ")
      output = ifelse(combinput %in% c("Unknown", "None of the above") | is.null(input),
                      "",
                      paste(preface, combinput))
    } else if(type == "text") {
      output = ifelse(input == "", "", paste(preface, input))
    } else stop("type argument only accepts 'mc' or 'text'")
    
    return(output)
    
  }

  
# setting app CSS ---------------------------------------------------------
  
  appCSS = '
        /* logo */
        .skin-blue .main-header .logo {
          background-color: #0D4C87;
        }
        /* logo when hovered */
        .skin-blue .main-header .logo:hover {
          background-color: #0D4C87;
        }
        /* navbar (rest of the header) */
        .skin-blue .main-header .navbar {
          background-image: url("https://i.postimg.cc/xdMFvD4b/header-image.png");
          background-size: 100% 100%;
          background-color: #98AF57;
        }
        /* main sidebar */
        .skin-blue .main-sidebar {
          background-color: #E6EDF3;
          color: #004987;
        }
        /* active selected tab in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
          background-color: #B3C6D9;
          color: #004987;
        }
        /* other links in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a{
          background-color: #E6EDF3;
          color: #004987;
        }
        /* toggle button when hovered  */
        .skin-blue .main-header .navbar .sidebar-toggle:hover{
          background-color: #B3C6D9;
          color: #004987;
        }
        /* body */
        .content-wrapper, .right-side {
          background-color: #FFFFFF;
        }
      '
  
  
  
  