# Graph Survival data

# labels for graph
# Trimming: Graph distribution of trims----
lact.labs <- c("1" = "1st Lactation", 
               "2" = "2nd Lactation",
               "3" = "3+ Lactation")

# Time to Disease Graph after 1st lesion----

# set up variables
trimtolame <- lamecull %>% # assigns dataframe
  filter (lifexnoninf == 1) %>% # filters out only 1st cases
  filter (ftdat >= startdat) |> # sets time frame
  select (cowid, farm, ftdat, lact, birth, frsh, lifexlame,
          lifexnoninf,
          time2nextftdat, time2nextlame, censordat) %>% 
  mutate(nextrmlame = if_else(is.na(time2nextlame),0,1), # needed to censor cows 
         # to align with labels
         lctgp = case_when(lact == 1 ~ "1",
                           lact == 2 ~ "2",
                           TRUE ~ "3+"))  

# KM graph
# Set the name 'trim2lame' as an alias for 'trimtolame' dataset
trim2lame <- trimtolame 


# Fit the survival model using the 'survfit' function
# censordat is the time variable, nextrmlame is the variable I'm intersted in 
# could be culling
# the ~ variable is the one you want to compare
fitKM <- survfit(Surv(censordat, nextrmlame) ~ lctgp, data = trim2lame)

# Create a Kaplan-Meier survival plot using 'ggsurvplot'
# most of this makes them pretty.
# you can just run the first line and it will create a graph)
km <- ggsurvplot(fitKM, 
                 pval = FALSE, 
                 ncol = 2,
                 conf.int = TRUE,
                 censor = FALSE,
                 fun = "pct",
                 size = 1,
                 linetype = c(1, 2, 3), # Specify dashed lines for each group
                 palette = c("#440154ff", "#3b528bff", "#fde725ff"),
                 legend = "bottom",
                 legend.title = "Lactation",
                 legend.labs = lact.labs,
                 xlab = "Days to Lameness after Treatment",
                 ylab = "Percentage of Healthy Cows",
                 xlim = c(0, 180),
                 ylim = c(50, 100),
                 break.time.by = 30,
                 short.panel.labs = TRUE) 
  # Set the fill colors and linetypes for each group in the legend and overide
  # the default where lines and colours are separate
  # to get codes library(RColorBrewer) brewer.pal(n=5,"Accent")
 

# this creates a table to illustrate graph above, 
# creates predicted risk of culling at time point X

# time to lameness table----

fit_farm <- survfit(Surv(censordat, nextrmlame) ~ lctgp, 
                    data = trimtolame)

# farm
tbl_time_2_lame_farm <- tbl_survfit(fit_farm,
                                    times = c(90, 120, 150, 180),
                                    label = " ",
                                    reverse = TRUE,
                                    label_header = "{time} Days") %>% 
  as_flex_table() %>% # makes formatting and pdf better
  add_header_row(top = TRUE,
                 values = c("Lactation",
                            "% Lame (Confidence Interval) at",
                            "",
                            "",
                            "")) %>% 
  bold(i = 1, bold = TRUE, part = "header") %>% # bolds headers
  bold(i = 2, bold = TRUE, part = "header") %>% 
  merge_at(i = 1:2, j = 1, part = "header") %>% #merges 1st row
  merge_at(i = 1, j = 2:5, part = "header") %>% # merges top columns
  autofit() %>% 
  fit_to_width(max_width= 6) |> 
  delete_rows( i= 1, part = "body") |> 
  hline_bottom(part = "body")

