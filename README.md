This work presents the process of creating a 3D visualization of Mars weather conditions. 
The data is based on annual surveys and has been measured at 4002 locations on the planet. 
This work focuses on presenting the distribution of values depending on the place and time for: 
temperature, pressure, carbon dioxide content in the atmosphere, as well as the strength and direction of blowing winds and the topography. 
The import_data.csv file imported data from csv files to the database. 
In the loading_and_converting_data.ipynb file, data from the database was imported into df and data transformations were performed. 
In the file transformation_from_points_to_polygons.ipynb, df was converted to gdf, point files were converted to polygons, 
and file types were transformed from shp to rasters and graphic files. 
Python files were used in the ArcGisPro application, in which static animations were made:

![image](https://github.com/AdaSzmygin/Mars-weather-conditions-visualization/assets/74568364/21ab6adc-d497-4512-b074-225d7f96f15a)

C# files were used in the Unity game engine for dynamic 3D animations:
![image](https://github.com/AdaSzmygin/Mars-weather-conditions-visualization/assets/74568364/0205415f-95fa-4998-be1b-d97c81ea7bfb)
