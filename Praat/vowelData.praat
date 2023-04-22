clearinfoline
form 
	sentence directory /Users/Scott/SCHOOL/STONYBROOK/Research/FinalDevoicing/Presentations/LIN650Phonetics/LIN650Recordings/Vowels
	word vowelLabel V
endform

dataFile$ = directory$ + "/VowelData.csv"
writeFileLine: dataFile$, "WORD,DURATION (ms),F1 (Hz),F2 (Hz)"
sound_strings = Create Strings as file list: "sound_list", directory$ + "/*.wav"
tg_strings = Create Strings as file list: "tg_list", directory$ + "/*.TextGrid"

numberOfFiles = Get number of strings

for ifile to numberOfFiles

	## import sound file ##
	selectObject: sound_strings
	sound_fileName$ = Get string: ifile
	Read from file: directory$ + "/" + sound_fileName$
	objectName$ = replace$(sound_fileName$,".wav", "",0)

	## import textgrid file ##
	selectObject: tg_strings
	tg_fileName$ = Get string: ifile
	Read from file: directory$ + "/" + tg_fileName$

	## get number of intervals on Vowel tier ##
	selectObject: "TextGrid 'objectName$'"
	vowelinterval = Get number of intervals: 2

	## create formant object ##
	selectObject: "Sound 'objectName$'"
	To Formant (burg): 0, 6, 7000, 0.025, 50

	## get values for each vowel ##
	for i to vowelinterval
	selectObject: "TextGrid 'objectName$'"
	label$ = Get label of interval: 2, i
	
	if label$ = "V"
		
		## Duration ##
		start = Get starting point: 2, i
		end = Get end point: 2, i
		duration = (end - start) * 1000
		midpoint = (start + end)/2

		## Formants ##
		selectObject: "Formant 'objectName$'"

		f1 = Get value at time: 1, midpoint, "Hertz", "Linear"
		f2 = Get value at time: 2, midpoint, "Hertz", "Linear"

		appendFileLine: dataFile$, objectName$, ",", fixed$(duration,2), ",", fixed$(f1,0), ",", fixed$(f2,0)
	endif
	endfor

	# remove this iteration's sound/tg objects
	selectObject: "Sound 'objectName$'"
	plusObject: "TextGrid 'objectName$'"
	plusObject: "Formant 'objectName$'"
	Remove
endfor

# remove string lists
selectObject: "Strings sound_list"
plusObject: "Strings tg_list"
Remove
