def reverseSentences(filename)
	file = File.open(filename, "r")
	@full = String.new
	while(line = file.gets)
		@word = line.split(/ /)
		@sentence = Array.new
		i = 0
		@para = String.new
		@sentence[i] = String.new
		@word.each do |w|
			unless(w == nil)
				w.strip!
				w.downcase!
				if(w.match(/[.]/))
					@sentence[i] =w.chomp(".").capitalize + " " + @sentence[i].strip + "."
					@para = @para + " " + @sentence[i]
					i = i+1
					@sentence[i] = String.new
				elsif(w.match(/[!]/))
					@sentence[i] =w.chomp("!").capitalize + " " + @sentence[i].strip + "!"
					@para = @para + " " + @sentence[i]
					i = i+1
					@sentence[i] = String.new
				elsif(w.match(/[?]/))
					@sentence[i] =w.chomp("?").capitalize + " " + @sentence[i].strip + "?"
					@para = @para + " " + @sentence[i]
					i = i+1
					@sentence[i] = String.new
				else
					@sentence[i] = w + " " + @sentence[i]
				end
			end
		end
		@full = @full + @para.strip.concat(10)
	end
	@full.strip!
	puts @full
	f = File.open("solution.txt","w")
	f.write(@full)
end
reverseSentences("programming_test.txt")