

tabItem(
  
  tabName = "psychedelics",
  
  fluidRow(
    
    ### Left Panel - Intro Text ### 
    column(width = 3, 
           
           wellPanel(
             
             HTML("
             <p style = 'font-size: 0.8em' >
             
             <span style = 'font-weight: bold' >What's this?</span>
             
             <br><br>
             
             Psychedelics (psilocybin and LSD) specific supplemental questions, similar to those in a VDL template. 
             
             <br><br>
             
             <span style = 'font-weight: bold' >What for?</span>
             
             <br><br>
             
            In the context of the observed increasing trends in psychedelic use, 
            the potential expansion of access to psychedelic substances for therapeutic purposes,
            and increasing calls for decriminalization of possession of psychedelic and 
            other substances, it is prudent to plan for ongoing surveillance of harms 
            associated for common psychedelic substances. 
            
            <br><br>

            The purpose of this system would be to provide information about long-term trends in 
            number of calls and factors associated with calls, in order to provide information 
            to guide potential policy and regulatory changes. 

            <br><br>
             
            <span style = 'font-weight: bold' >When to use this?</span>
             
            <br><br>
             
            During the documentation of a call where the following is a relevant substance in the case management.
             
            <br><br>
            
            <span style = 'text-decoration: underline' >1. Psilocybin</span>:

            <br>

            The substance field AAPCC Generic Code is recorded as 058000 MUSHROOM HALLUCINOGENIC 
            <span style = 'font-weight: bold' >except</span> 
            <em>Panaeolus</em> Foenisecii, lawnmower or haymaker.
            
            <br><br>
             
            <span style = 'text-decoration: underline' >2. LSD</span>:
          
            <br>
            
            The substance field AAPCC Generic Code is recorded as 027000 LSD. 
	          
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
              
              There are other key pieces of psychedelics (psilocybin and LSD) exposure information that can be entered into existing VDL data fields. 
              If known, this is a reminder to document the following. 
              
              <ul style = 'font-size: 0.8em' >
                
                <li>
                Exact age
                </li>
                
                <li>
                Sex
                </li>
                
                <li>
                Caller type
                </li>
                
                <li>
                Patient flow and hospital flow (if applicable)
                </li>
                
                <li>
                Outcome
                </li>
                
                <li>
                In unintentional exposure cases, document how the product was packaged, stored, and accessed in the  
                <span style = 'text-decoration: underline' >case Note</span>
                </li>
                
              </ul> 
              
              </p>
                   ") 
               
             )
             
           ),
           
           # survey inputs
           fluidRow(
             
             column(width = 8,
                    # product info
                    HTML("
                    <p style = 'font-style: italic; text-align: center; padding: 0px;'>
                    All Cases
                    </p>
                         "),
                    hr(),
                    
                    uiOutput("psy_source"),
                    uiOutput("psy_source_other"),
                    uiOutput("psy_formulation"),
                    uiOutput("psy_form_edible")
                    
                    
             )
             
           )
           
    ),
    
    ### Right Panel - Text Output ### 
    column(width = 3, 
           
           wellPanel(
             fluidRow(column(12, align = "center", uiOutput("psy_clip"))),
             hr(),
             fluidRow(column(12, align = "center", em("Psychedelics Supplemental Info"))),
             htmlOutput("psy_cond.break"),
             htmlOutput("psy_display.text"),
             hr(),
             fluidRow(column(12, align = "center", actionButton(inputId = "psy_reset", label = "Reset")))
           )
           
    )
    
  )
  
)