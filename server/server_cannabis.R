

# cannabis specific reason for use 
output$can_reason = renderUI({
  
  tipify(
    prettyRadioButtons(inputId = "can_reason",
                       label = "Cannabis specific reason for use?",
                       choices = c("Recreational", 
                                   "Medical", 
                                   "Self-Medical",
                                   "None of the above"),
                       selected = "None of the above"),
    title = paste("Recreational use: If there was an explicit mention of recreational use or if contextual information suggests recreational use (e.g., taken with friends, at a party).",
                  "Medical use: If there was a mention of a cannabis medical prescription or obtained from a medical dispensary.",
                  "Self-Medical use: If there was a mention of use for any sort of medical condition or state (e.g., pain, sleep) with no mention of a prescription or medical dispensary source.", 
                  sep = "<br><br>")
  )
  
})

# more reason for use info text box
output$can_reason_extra = renderUI({
  
  textInput(inputId = "can_reason_extra",
            label = "More reason for use info:",
            placeholder = "e.g., adjunct to chemo")
  
})

# source group checkbox
output$can_source = renderUI({
  
  tipify(
    prettyCheckboxGroup(inputId = "can_source",
                        label =  "Source?",
                        choices = c("Prescription",
                                    "Family or friend", 
                                    "Licensed retailer",
                                    "Unlicensed retailer", 
                                    "Street purchase", 
                                    "Homegrown",
                                    "Other"),
                        status = "primary",
                        shape = "curve"),
    title = "Where/How the individual acquired the cannabis product."
  )
  
})

# more source info text box
output$can_source_extra = renderUI({
  
  textInput(inputId = "can_source_extra",
            label = "More source info:",
            placeholder = "e.g., retailer name")
  
})

# use history
output$can_usehx = renderUI({
  
  tipify(
    prettyRadioButtons(inputId = "can_usehx",
                       label = "Use history?",
                       choices = c("Unknown", 
                                   "New or inexperienced user", 
                                   "Previous user"),
                       selected = "Unknown"),
    title = "Previous experience with using any cannabis product."
  )
  
})

# extra use history
output$can_usehx_extra = renderUI({
  
  textInput(inputId = "can_usehx_extra",
            label = "More use history info:",
            placeholder = "e.g., current weekly user")
  
})

# packaging 
output$can_package = renderUI({
  
  textAreaInput(inputId = "can_package",
                label = "Packaging details?",
                placeholder = "e.g., child-proof sealed",
                resize = "vertical")
  
})

# access
output$can_access = renderUI({
  
  textAreaInput(inputId = "can_access",
                label = "How was the product accessed?",
                placeholder = "e.g., left on counter",
                resize = "vertical")
  
})

# text output
can_copy.text = reactive({
 
  reason = show.text("Reason:", input$can_reason, type = "mc")
  reason_extra = show.text("More Reason Info:", input$can_reason_extra, type = "text")
  source = show.text("Source:", input$can_source, type = "mc")
  source_extra = show.text("More Source Info:", input$can_source_extra, type = "text")
  usehx = show.text("Use Hx:", input$can_usehx, type = "mc")
  usehx_extra = show.text("More Use Hx Info:", input$can_usehx_extra, type = "text")
  package = show.text("Packaging:", input$can_package, type = "text")
  access = show.text("Access:", input$can_access, type = "text")
  
  can_copy.text = paste(reason, reason_extra,
                        source, source_extra,
                        usehx, usehx_extra,
                        package, access,
                        sep = "<br>")
  
  can_copy.text = gsub("(<br>)+$", "", can_copy.text)
  can_copy.text = gsub("^(<br>)+", "", can_copy.text)
  can_copy.text = gsub("(<br>)\\1+", "\\1", can_copy.text)
  
})

can_cond.break = reactive({
  
  can_cond.break = ifelse(can_copy.text() == "", "", "<br>")
  
})

output$can_cond.break = renderUI(HTML(can_cond.break()))

output$can_display.text = renderUI(HTML(can_copy.text())) 

# copy button 
output$can_clip = renderUI({
  
  out.text = paste("*Cannabis Supplemental Info*", can_copy.text(), "*end*", sep = "<br>")
  out.text = gsub("<br>", "\n", out.text)
  
  rclipButton(inputId = "can_clipbtn",
              label = "Copy Text",
              clipText = out.text)
  
})

# reset button 
observeEvent(input$can_reset, {
  
  reset("can_reason")
  reset("can_reason_extra")
  reset("can_source")
  reset("can_source_extra")
  reset("can_usehx") 
  reset("can_usehx_extra")
  reset("can_package")
  reset("can_access")
  
})
