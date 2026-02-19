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
if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("ggplot2")

# Load packages into your environment
library("rplum")
library("rbacon")
library("rintcal")
library("tidyverse")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.0 Run demo from package-----------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Define Core name
core_name <- "test"

#Plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

# Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

#write csv to 
mycore <- read.csv(system.file("extdata/Cores/HP1C/HP1C.csv", package="rplum"))
write.csv(mycore, paste0("Plum_runs/", core_name,"/",core_name,".csv"), row.names=F)

#Initilize file structure
Plum(core = "test", date.sample = 2018, n.supp=3, ra.case=0)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3.0 Run PIE1 Core-------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Define Core name
core_name <- "PIECore1"

#Create plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

#Create Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

#write csv to 
mycore <- read.csv('data/PIECore1.csv')
write.csv(mycore, paste0("Plum_runs/", core_name,"/",core_name,".csv"), row.names=F)

#Initilize file structure
Plum(core = core_name, date.sample = 2015.5, n.supp=3, ra.case=0)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4.0 Run PIE2 Core-------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Define Core name
core_name <- "PIECore2"

#Create plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

#Create Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

#write csv to 
mycore <- read.csv('data/PIECore2.csv')
mycore <- mycore %>% slice(1:40)
write.csv(mycore, paste0("Plum_runs/", core_name,"/",core_name,".csv"), row.names=F)

#Initilize file structure
Plum(core = core_name, date.sample = 2015.5, n.supp=3, ra.case=0)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5.0 Run PIE7 Core-------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Define Core name
core_name <- "PIECore7"

#Create plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

#Create Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

#write csv to 
mycore <- read.csv('data/PIECore7.csv')
write.csv(mycore, paste0("Plum_runs/", core_name,"/",core_name,".csv"), row.names=F)

#Initilize file structure
Plum(core = core_name, date.sample = 2015.5, n.supp=3, ra.case=0)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 6.0 Run PIE8 Core-------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Define Core name
core_name <- "PIECore8"

#Create plum runs folder
if (!dir.exists("Plum_runs")) dir.create("Plum_runs")

#Create Core-specific subfolder
if (!dir.exists(paste0("Plum_runs/", core_name))) dir.create(paste0("Plum_runs/", core_name))

#write csv to 
mycore <- read.csv('data/PIECore8.csv')
write.csv(mycore, paste0("Plum_runs/", core_name,"/",core_name,".csv"), row.names=F)

#Initilize file structure
Plum(core = core_name, date.sample = 2015.5, n.supp=3, ra.case=0)

