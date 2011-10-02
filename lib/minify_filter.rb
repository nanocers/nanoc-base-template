require 'rainpress'
require 'jsmin'

# This filter can process javascript and stylesheet files and based on their
# extension it applies Rainpress or JSMin to its contents.
class MinifyFilter < Nanoc3::Filter
  identifier :minify
  def run(content, args = {})
    puts @item[:extension]
    case @item[:extension]
      when 'css', 'sass'    then puts "rainpress"; Rainpress.compress(content)
      when 'js', 'coffee'   then puts "jsmin"; JSMin.minify(content)
      else
        content
      end
  end
end
