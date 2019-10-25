
require "open-uri"
require "nokogiri"
Encoding.default_external = 'utf-8'


dir_get=__dir__
write_bit=dir_get+"/output/test_out1.txt"
org_list=dir_get+"/compgenome_1.tab"
input_search=dir_get+"/input/*.tab"
input_txt=""
p input_search
Dir.glob(input_search) do |item|
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
  file4.print("\t")
  file4.print line3.chomp
end
file5=File.open(input_txt, "r")
f_data=[]
while lin=file5.gets
  f_data.push(lin)
  j+=1
end
y=j
file4.print ("\n")
f_data.each do |line|
  p i
  print(line)
  array=line.split("\t")
  file4.print array[0]
  #print("\t")
  id=array[0].to_s.chomp
  ids=id.gsub(";","")
  ids=ids.gsub("\n","")
  url=base1+ids
  charset = nil
  print(url)
  html = open(url) do |f|
    charset=f.charset
    f.read
  end


  doc=Nokogiri::HTML.parse(html, nil, charset)

  doc.xpath('/html/body').each do |node|
    file2=File.open(org_list, "r")
    while line2=file2.gets
      org=line2.chomp
      a=node.to_s
      a.split("\n").each do |a1|
        if false==a1.include?("#")
          b=a1.split("\t")
          c=b[-1].to_s
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
