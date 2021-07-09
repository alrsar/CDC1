

ui = dashboardPage(
  
  # header
  dashboardHeader(

    title = "BC Drug and Poison Information Centre",
    titleWidth = 400

  ),
  
  # sidebar
  dashboardSidebar(

    # Remove the sidebar toggle element
    tags$script(JS("document.getElementsByClassName('sidebar-toggle')[0].style.visibility = 'hidden';")),

    sidebarMenu(
      menuItem("Cannabis", tabName = "cannabis", icon = icon("cannabis")),
      menuItem("Psychedelics", tabName = "psychedelics", icon = icon("pills"))
      
    )

  ),

  # body
  dashboardBody(
    
    useShinyjs(),
    rclipboardSetup(),
    inlineCSS(appCSS),

    tabItems(

      # cannabis tab
      tabItem(tabName = "cannabis", source("ui/ui_cannabis.R", local = T)$value),
      
      # psychedelics tab
      tabItem(tabName = "psychedelics", source("ui/ui_psychedelics.R", local = T)$value)


    )

  )
  
) 