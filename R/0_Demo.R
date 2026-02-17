#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: PLUM model demo
# Date: 2/12/2026
# Coder: Nate Jones (modified Caleb Novinger)
# Subject: Running PLUM model on Plum Island Cores
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.0 Setup workspace ----------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Clear console
rm(list = ls())

#Download packages 
if (!requireNamespace("rplum", quietly = TRUE)) install.packages("rplum")
if (!requireNamespace("rbacon", quietly = TRUE)) install.packages("rbacon")
if (!requireNamespace("rintcal", quietly = TRUE)) install.packages("rintcal")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

# Load packages into your environment
library("rplum")
library("rbacon")
library("rintcal")
library("ggplot2")

#Define name of core
core_name <- "PIECore2"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.0 Demo core ----------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Create folder structure ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

# Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

# Find and copy core data files
files_to_copy <- list.files("data", pattern = core_name, full.names = TRUE)
file.copy(files_to_copy, paste0("Plum_runs/", core_name))
list.files(paste0("Plum_runs/", core_name))

#Move over auxilerary data (mannually)
file.copy("data/Cs137Data2.csv", paste0("Plum_runs/", core_name))

#Define core data
myCRS <- read.table(paste0("Plum_runs/",core_name, "/", "CRS_CIC_ResultsPIECore2.txt"))

#Run PLUM model ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Run PLUM model on core
Plum(
  core = "PIECore2", 
  otherdates = "Cs137Data2.csv", 
  ra.case = 0, 
  n.supp = 3, 
  date.sample = 2015.5)

#Finish Plot
agedepth(set = info,
         pb.lim = c(),  # This removes the Pb-210 axis
         plot.pb = FALSE,  # This excludes the Pb-210 data points
)
lines(myCRS$V1,myCRS$V2,lwd=3, col = "orange")
lines(myCRS$V1,myCRS$V4,lwd=3, col = "blue")
