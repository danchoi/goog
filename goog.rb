#!/usr/bin/env ruby
require 'nokogiri'
require 'cgi'
require 'yaml'
require 'uri'


unless `which tidy` =~ /tidy/
  abort "No tidy found. Please install tidy."
end

if RUBY_VERSION !~ /^1.9/
  abort "Requires Ruby 1.9"
end

CACHE = '~/.google-rubygem'
`mkdir -p #{CACHE}`

def fetch(query)
  query = CGI.escape query
  curl = "curl -s -A Mozilla http://www.google.com/search?q=#{query} | 
      tidy --wrap 0 -indent -ashtml --merge-divs yes 2>/dev/null"
  STDERR.puts curl
  resp = %x{#{curl}}
  doc = Nokogiri::HTML resp
  results = doc.search('ol li.g').map {|li|
    next unless li.at('h3 a')
    link = li.at('h3 a')['href']
    title = li.at('h3 a').inner_text
    d = li.at('div.s')
    excerpt = if d 
                d.search('span').remove 
                excerpt = d.inner_text.strip
              end
    {title: title, link: link, excerpt: excerpt}
  }.compact
  save(results)
  results
end

def pretty_print(results)
    puts '==' * 40
  results.each_with_index do |r,idx|
    puts <<END
#{idx}  #{r[:title]}
   #{r[:link]}
   #{(r[:excerpt] || '').gsub(/(\s){2,}/, '\1')}
END
    puts '--' * 40
  end
end

def save(results)
  File.open(File.expand_path("#{CACHE}/search_results_2.yml"), "w") {|f| f.puts results.to_yaml}
end

def open(result_number, gui=false)
  results = YAML::load File.read(File.expand_path("#{CACHE}/search_results_2.yml"))
  target = results[result_number.to_i]
  if gui
    `open #{target[:link]}`
  else
    /q=(?<url>[^&]+)/ =~ target[:link]
    url = URI.unescape(url)
    cmd = %Q{el3 "#{url}" }
    puts cmd
    exec cmd
  end
end

if __FILE__ == $0
  if ARGV.size == 1 && ARGV.first =~ /^\d/ 
    puts 'test'
      open(ARGV.first)
  elsif ARGV.first =~ /^w\d/ # open in graphical browser
      open ARGV.first.gsub('w', ''), true
  elsif ARGV.first =~ /e\d/ # open in elinks
    results = YAML::load File.read(File.expand_path("#{CACHE}/search_results_2.yml"))
    result_number = ARGV.first.sub('e', '')
    target = results[result_number.to_i]
    puts target
    cmd = "elinks '#{target[:link]}'"
    exec cmd
  elsif ARGV.first =~ /^c\d/ # show url
    results = YAML::load File.read(File.expand_path("#{CACHE}/search_results_2.yml"))
    result_number = ARGV.first.sub(/u/,'')
    target = results[result_number.to_i]
    system("curl -s '#{target[:link]}' | less")
  elsif ARGV.empty?
    pretty_print YAML::load File.read(File.expand_path("#{CACHE}/search_results_2.yml"))
  else
    pretty_print(fetch ARGV.join(' '))
  end
end

