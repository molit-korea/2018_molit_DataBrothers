# inital setting
rm(list = ls())
dir <- 'C:/Users/Taewoong/Projects/Hackerthon/01_Code'
setwd(dir)

source("functions/import_packages.r")

# input
rest_type <- '����Ʈ' # '�ټ���', '����Ʈ', '���ǽ���'
price_type <- '����' # '�Ÿ�', '����'

# file path
file_path <- "../00_Data/�ǰŷ���_OUT/"

# set time sequence
time_seq <- tibble(c_date = seq(as.Date('2011-01-01'), as.Date('2018-04-01'), by = 'month'))
yr_mon <- format(time_seq$c_date, "%Y%m")

# set file names
file_name_1 <- paste('TBL_Mod_�����_����', rest_type, price_type, sep='_')
file_name_2 <- '../�����_��ǥ/WGS84_GU_�����_��ġ'
out_name <- paste('MPG_�����_����', rest_type, price_type, 'Historical', sep='_')

# read data
data_1 <- as.tibble(fread(paste(file_path, file_name_1, '.csv', sep = '')))
data_2 <- as.tibble(fread(paste(file_path, file_name_2, '.csv', sep = '')))

df1 <- data_1 %>%
	left_join(data_2, by="c_gu") %>%
	select(c_date, c_si, c_gu, id=c_id, c_mean, c_median, c_mean_per_area,
		c_median_per_area, is_na)

out_df <- df1

write.csv(out_df, paste(file_path, out_name, '.csv', sep=''), row.names=FALSE)

