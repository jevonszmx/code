files = Dir.glob("*.png")

puts "Creating directory: uncrushed"
if File.directory?("uncrushed")
	puts "Directory already exists... delete and proceed? (y/n)"
	input = gets.strip
	if input == "y"
		deletefiles = Dir.glob("uncrushed/*.png")
		deletefiles.each do |f|
			File.delete(f)
		end
		Dir.delete("uncrushed")
	else
		abort
	end
else
end
Dir.mkdir("uncrushed")
files.each do |f|
	puts "Found file: #{f}... uncrushing it because we street!"
		`/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush -revert-iphone-optimizations -q #{f} uncrushed/#{f}`
	puts "Creating new file: #{f}"
end