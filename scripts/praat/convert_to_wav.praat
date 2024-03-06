

#
# Form setup
#

form Change file format to wav
	sentence Path_to_files ./all/
	sentence Where_to_save ./adjusted/
	sentence File_format mp3
endform

# Shorten variables
path$ = path_to_files$
outputDir$ = where_to_save$
format$ = file_format$
ending$ = "." + format$
search_string$ = "*" + ending$

# -----------------------------------------------------------------------------


#
# Prepare loop ----------------------------------------------------------------
#

# Go to folder where files are located, create list
Create Strings as file list: "fileList", path$ + search_string$

# Select the object fileList
selectObject: "Strings fileList"

# Count # of files and assign total to 'numFiles'
numFiles = Get number of strings

# -----------------------------------------------------------------------------



#
# Start loop ------------------------------------------------------------------
#

for i from 1 to numFiles
	
	# Select string
	select Strings fileList
	fileName$ = Get string... i
	prefix$ = fileName$ - ending$
	Read from file... 'path$'/'prefix$''ending$'
	Save as WAV file: outputDir$ + prefix$ + ".wav"

endfor

# -----------------------------------------------------------------------------



#
# Clean objects and finish ----------------------------------------------------
#

select all
Remove

writeInfoLine: "Finished! :)"
appendInfoLine: "The modified sound files can be found in:"
appendInfoLine: "'", outputDir$, "'"

# -----------------------------------------------------------------------------
