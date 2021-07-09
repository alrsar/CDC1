

# source group checkbox
output$psy_source = renderUI({
  
  tipify(
    prettyCheckboxGroup(inputId = "psy_source",
                        label =  "Source?",
                        choices = c("Purchased at a dispensary or cannabis shop",
                                    "Purchased online", 
                                    "A source other than a dispensary or online",
                                    "Received as a gift", 
                                    "Foraged", 
                                    "Grew own",
                                    "Unknown",
                                    "Other"),
                        status = "primary",
                        shape = "curve"),
    title = "Where/How the individual acquired the hallucinogenic mushroom product."
  )
  
})

# more source info text box
output$psy_source_other = renderUI({

  textInput(inputId = "psy_source_other",
            label = "Other source info:",
            placeholder = "e.g., retailer name")

})

# use formulation
output$psy_formulation = renderUI({

  tipify(
    prettyRadioButtons(inputId = "psy_formulation",
                       label = "Fomulation?",
                       choices = c("Dried or fresh mushroom",
                                   "Edible (specify type)",
                                   "Liquid/brewed",
                                   "Capsules/tablets",
                                   "Powder/crystals/granules",
                                   "Blotter",
                                   "Other",
                                   "Unknown"),
                       selected = "Unknown"),
    title = "Type or form of hallucinogenic mushrooms exposed."
  )

})

# extra use history
output$psy_form_edible = renderUI({

  textInput(inputId = "psy_form_edible",
            label = "Type of edible",
            placeholder = "e.g., chocolate, gummies")

})


# text output
psy_copy.text = reactive({

  source = show.text("Source:", input$psy_source, type = "mc")
  source_other = show.text("Other Source Info:", input$psy_source_other, type = "text")
  formulation = show.text("Formulation:", input$psy_formulation, type = "mc")
  form_edible = show.text("Type of edible:", input$psy_form_edible, type = "text")

  psy_copy.text = paste(source, source_other,
                    formulation, form_edible,
                    sep = "<br>")

  psy_copy.text = gsub("(<br>)+$", "", psy_copy.text)
  psy_copy.text = gsub("^(<br>)+", "", psy_copy.text)
  psy_copy.text = gsub("(<br>)\\1+", "\\1", psy_copy.text)

})

psy_cond.break = reactive({

  psy_cond.break = ifelse(psy_copy.text() == "", "", "<br>")

})

output$psy_cond.break = renderUI(HTML(psy_cond.break()))

output$psy_display.text = renderUI(HTML(psy_copy.text()))

# copy button
output$psy_clip = renderUI({

  out.text = paste("*Psychedelics Supplemental Info*", psy_copy.text(), "*end*", sep = "<br>")
  out.text = gsub("<br>", "\n", out.text)

  rclipButton(inputId = "clipbtn",
              label = "Copy Text",
              clipText = out.text)

})

# reset button
observeEvent(input$psy_reset, {

  reset("psy_source")
  reset("psy_source_other")
  reset("psy_formulation")
  reset("psy_form_edible")

})
