selectObject: "TextGrid PUT"
nintervals = Get number of intervals: 4

for i to nintervals

	label$ = Get label of interval: 4, i

	if label$ == "V"

		startpoint = Get start time of interval: 4, i
		endpoint = Get end time of interval: 4, i
		duration = 1000 * (endpoint-startpoint)

		midpoint = (startpoint + endpoint) / 2
		segment_interval = Get interval at time: 3, midpoint

		vowel_label$ = Get label of interval: 3, segment_interval


		print 'vowel_label$' 'tab$' 'duration' 'newline$'

	endif

endfor
