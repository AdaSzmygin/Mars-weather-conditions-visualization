create table data_mars(
id int,
x float,
y float,
z float,
lattitude float,
longitude float,
spec float,
n1 float,n2 float,n3 float,n4 float,n5 float,n6 float,
a1 float,a2 float,a3 float,a4 float,a5 float,a6 float,
atm_pressure float,atm_density float,temperture float,zonal_wind float,
meridional_wind float,extvar_0 float,
extvar_1 float,extvar_2 float,extvar_3 float,extvar_4 float,extvar_5 float,extvar_6
float,extvar_7 float,extvar_8 float,
extvar_9 float,extvar_10 float,extvar_11 float,extvar_12 float,extvar_13 float,
extvar_14 float,extvar_15 float,
extvar_16 float,extvar_17 float,extvar_18 float,extvar_19 float,extvar_20 float,
extvar_21 float,extvar_22 float,
extvar_23 float,extvar_24 float,extvar_25 float,extvar_26 float,extvar_27 float,
extvar_28 float,extvar_29 float,
extvar_30 float,extvar_31 float,extvar_32 float,extvar_33 float,extvar_34 float,
extvar_35 float,extvar_36 float,
extvar_37 float,extvar_38 float,extvar_39 float,extvar_40 float,extvar_41 float,
extvar_42 float,extvar_43 float,
extvar_44 float,extvar_45 float,extvar_46 float,extvar_47 float,extvar_48 float,
extvar_49 float,extvar_50 float,
extvar_51 float,extvar_52 float,extvar_53 float,extvar_54 float,extvar_55 float,
extvar_56 float,extvar_57 float,
extvar_58 float,extvar_59 float,extvar_60 float,extvar_61 float,extvar_62 float,
extvar_63 float,extvar_64 float,
extvar_65 float,extvar_66 float,extvar_67 float,extvar_68 float,extvar_69 float,
extvar_70 float,extvar_71 float,
extvar_72 float,extvar_73 float,extvar_74 float,extvar_75 float,extvar_76 float,
extvar_77 float,extvar_78 float)

Bulk Insert data_mars
	from 'C:\projects\Mars_weather\dane4002\out_grid_4002_0h_0_sollon.csv'
	with
	(
		format = 'CSV',
		firstrow = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '0x0a'
	)

select * from data_mars

create table files (names varchar(100))

Bulk Insert files
	from 'C:\projects\Mars_weather\dane4002\files_name.txt'

delete from files where names like '%.txt'

alter table files add path varchar(200)

update files set path = concat('C:\projects\Mars_weather\dane4002\', names)

select * from files

delete from data_mars

declare @mysqltext nvarchar(250)
declare @mypath nvarchar(250)
Declare mycursor cursor forward_only
for select path from files
open mycursor
fetch next from mycursor into @mypath
while @@FETCH_STATUS = 0
Begin
set @mysqltext =
'Bulk Insert data_mars
from '''+ @mypath +

''' with
(
FIRSTROW = 2,
FIELDTERMINATOR = '';'',
ROWTERMINATOR = ''0x0a'',
format = ''CSV''
)'
execute sp_executesql @mysqltext
fetch next from mycursor into @mypath
end
close mycursor
deallocate mycursor

select * from data_mars