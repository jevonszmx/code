## 从app中提取有效png图片

=begin 
xcode打包ipa过程中，将图片使用pngcrush程序优化过了，具体的技术细节可以参看Apple的官方技术文档（英文）和Pngcrush的官方网站（英文）。那要如何将这些被优化过的图片“反优化”成可以浏览的图片文件呢？Apple的技术文档中给了相应的方法：
In iPhone SDK 3.2 and later, the pngcrush tool supports a command line option, -revert-iphone-optimizations, that undoes the optimizations done during the Xcode build process. So, to view an optimized PNG file, you should first undo the optimization and then open it with Preview.
 
方法就是，如果你使用的iOS SDK版本在3.2之后，在terminal里执行以下命令：
 
$ /Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush\ -revert-iphone-optimizations -q Local.png Local-standard.png
 
当然，你也可以写一个script或者将script封装成一个Mac OS app来简化工作。不过，Github上已经有别人写好的，你只需要下载下来使用即可。 以上便是如何从封装好的ipa文件中提取图片文件的方法。
 
批量还原png的脚本如下，把以下代码复制，保存为“ruby uncrush.rb”文件，放置你的目标文件夹中，并运行，它会创建一个"uncrushed"文件夹，还原的png将放置在这里。

=end

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
		`/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush -revert-iphone-optimizations -q #{f} uncrushed/#{f}`
	puts "Creating new file: #{f}"
end
