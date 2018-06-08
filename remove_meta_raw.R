# unit_area <- 3.305785 # 1��=3.305785m^2

# inital setting
rm(list = ls())
dir <- 'C:/Users/Taewoong/Projects/Hackerthon/01_Code'
setwd(dir)

source("functions/import_packages.r")
library(readxl)
library(xlsx)

# input
rest_type <- '����Ʈ' # '�ټ���', '����Ʈ', '���ǽ���'
price_type <- '�Ÿ�' # '����', '����'
out_name <- paste('TBL_�����_', rest_type, '_', price_type, '.csv', sep='')

# file path
filepath <- '../00_Data/�ǰŷ���_RAW'
out_path = "../00_Data/�ǰŷ���_OUT"
#dir.create(out_path)

# set time sequence
time_seq <- tibble(c_date = seq(as.Date('2015-01-01'), as.Date('2015-12-01'), by = 'month'))
yr_mon <- format(time_seq$c_date, "%Y%m")

filename <- paste(rest_type, '(', price_type,')_�ǰŷ���_', yr_mon, '.xlsx', sep='')
file_path_name <- paste(filepath, filename, sep = '/')

# collect all data to one df
for (ix in 1:length(file_path_name)){
ix <- 1
rest_price <- as.tibble(read_excel(file_path_name[ix], skip = 15))
rest_price
write.xlsx(rest_price, filename[ix], sheetName = "sheet1", append = FALSE, row.names=FALSE)
}