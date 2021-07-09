

tabItem(
  
  tabName = "cannabis",
  
  fluidRow(
    
    ### Left Panel - Intro Text ### 
    column(width = 3, 
           
           wellPanel(
             
             HTML("
             <p style = 'font-size: 0.8em' >
             
             <span style = 'font-weight: bold' >What's this?</span>
             
             <br><br>
             
             Cannabis specific supplemental questions, similar to those in a VDL template. 
             
             <br><br>
             
             <span style = 'font-weight: bold' >What for?</span>
             
             <br><br>
             
             The BC Ministry of Health is interested in gaining more information on cannabis 
             use through calls made to DPIC. The case notes in particular hold a lot of this 
             useful information. We can extract 
             <span style = 'text-decoration: underline' >some</span>
             supplemental key points from the cases notes in a timely and accurate manner, if 
             <span style = 'text-decoration: underline' >some</span>
             of the case note text is systematically structured.
             
             <br><br>
             
             <span style = 'font-weight: bold' >When to use this?</span>
             
             <br><br>
             
             During the documentation of a call where cannabis is a relevant substance in the case management.
             
             <br><br>
                                 
             <span style = 'font-weight: bold' >How to use this?</span>
             
             <br><br>
             
             Fill out the relevant survey fields when a caller volunteers this information
             or provides it in response to a direct question.
             
             <br><br>
             
             Copy and paste the structured text output back into VDL's case note section.
             Please do not edit the copied text after pasting into VDL as the
             set structure is what allows for timely data extraction. 
             
             <br><br>
             
             This applies to initial and follow-up calls. 
             Addendums will be accounted for where the more 
             recently entered value will simply overwrite the previously entered value for that particular field 
             
             </p>
                  ")
             
           )
    ),
    
    ### Central Panel - Survey Inputs ### 
    column(width = 6,
           
           # existing vdl data fields
           fluidRow(
             
             wellPanel(
               
              HTML("
              <p style = 'font-size: 0.8em' >
              
              <span style = 'font-weight: bold' >Reminders</span>
              
              <br><br>
              
              There are other key pieces of cannabis exposure information that can be entered into existing VDL data fields. 
              If known, this is a reminder to document the following. 
              
              <ul style = 'font-size: 0.8em' >
                
                <li>
                Define cannabis edibles with the 310121 Marijuana: Edible Preparation 
                <span style = 'text-decoration: underline' >AAPCC generic code</span>
                </li>
                
                <li>
                Document product name, edible type (e.g., brownie, gummy) if relevant, and THC 
                concentration (e.g., 10 MG) in the  
                <span style = 'text-decoration: underline' >Substance Verbatim</span>
                field
                </li>
                
                <li>
                Document amount exposed in the 
                <span style = 'text-decoration: underline' >MGS</span>
                and  
                <span style = 'text-decoration: underline' >Substance Quantity Unit</span>
                fields
                </li>
                
                <li>
                In unintentional exposure cases, document how the product was packaged, stored, and accessed in the  
                <span style = 'text-decoration: underline' >Case Note</span>
                </li>
                
              </ul> 
              
              </p>
                   ") 
               
             )
             
           ),
           
           # survey inputs
           fluidRow(
             
             column(width = 6,
                    # product info
                    HTML("
                    <p style = 'font-style: italic; text-align: center; padding: 0px;'>
                    All Cases
                    </p>
                         "),
                    hr(),
                    
                    uiOutput("can_reason"),
                    uiOutput("can_reason_extra"),
                    uiOutput("can_source"),
                    uiOutput("can_source_extra")
                    
                    
             ),
             
             column(width = 6,
                    HTML("
                    <p style = 'font-style: italic; text-align: center; padding: 0px;'>
                    Intentional Exposures
                    </p>
                         "),
                    hr(),
                    uiOutput("can_usehx"),
                    uiOutput("can_usehx_extra")
             )
             
           )
           
    ),
    
    ### Right Panel - Text Output ### 
    column(width = 3, 
           
           wellPanel(
             fluidRow(column(12, align = "center", uiOutput("can_clip"))),
             hr(),
             fluidRow(column(12, align = "center", em("Cannabis Supplemental Info"))),
             htmlOutput("can_cond.break"),
             htmlOutput("can_display.text"),
             hr(),
             fluidRow(column(12, align = "center", actionButton(inputId = "can_reset", label = "Reset")))
           )
           
    )
    
  )
  
)