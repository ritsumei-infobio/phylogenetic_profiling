require "open-uri"# Loading a open-uri library to access a URL
require "nokogiri"# Loading a Nokogir library 
Encoding.default_external = 'utf-8'#character code, utf-8


dir_get=__dir__
write_bit=dir_get+"/output/test_out1.txt"
org_list=dir_get+"/compgenome_1.tab"
input_search=dir_get+"/input/*.tab"
input_txt=""
Dir.glob(input_search) do |item|# Only an input file
	p input_txt=item
end
i=0
j=0
k=0
l=0
count=0
file4=File.open(write_bit, "w")
base1="http://rest.genome.jp/oc/"
file4.print("entry")
file3=File.open(org_list, "r")
while line3=file3.gets
	# Read one line. Returns character as value on success, null on EOF (end of file) 
	file4.print("\t")
	file4.print line3.chomp# Store target protein described in compgenome_1.tab in array f_dat
end

file5=File.open(input_txt, "r")
f_data=[]
while lin=file5.gets
	f_data.push(lin)# Write the target protein described in input_txt to test_out1.txt
	# Read one line. Returns character as value on success, null on EOF (end of file) 
	j+=1
end

file4.print ("\n")
f_data.each do |line|
	p i
	print(line)
	array=line.split("\t")
	#Tab delimited Ex "aa\tbb"→array["aa","bb"]
	file4.print array[0]
	id=array[1].to_s.chomp # Remove line feed code 
	ids=id.gsub(";","")
	ids=ids.gsub("\n","")
	url=base1+ids
	charset = nil
	html = open(url) do |f|
		charset=f.charset# Get character types
		f.read# Read a html file
 	end
	# Parse html and generate object 
	doc=Nokogiri::HTML.parse(html, nil, charset)
	doc.xpath('/html/body').each do |node|# Assign xpath to / node / in each line of html / body in doc. 
	file2=File.open("C:\\Users\\infobio\\Desktop\\atumori1\\compgenome.txt", "r")
		# Search for target species 
		while line2=file2.gets
			org=line2.chomp# 
			a=node.to_s# convert node to string 
			a.split("\n").each do |a1|
				if false==a1.include?("#") 
					b=a1.split("\t")
					c=b[-1].to_s# Specify the first array 
					d=c.split(":")
					if d[0].size<=5 
						e=d[0].to_s
						count=0
						if org==e
							file4.print("\t1")
							count=1 
							break
						end
					end
				end
			end
			if count==0
				file4.print("\t0") 
			end
		end
	end
	file4.print("\n")
	i+=1
	if i==j
		break
	end
end
