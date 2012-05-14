require 'json'

@@gallery_count = 0

def gallery(name)
  @@gallery_count += 1

  html_id = "gallery_#{@@gallery_count}_#{name}"
  images_dir = "content/galleries/#{name}"
  out_dir = "galleries/#{name}/"

  _galleria(html_id, images_dir, out_dir)
end

def _galleria(html_id, images_dir, out_dir = '')
	"""
		<div id='#{html_id}'></div>

		<script>
      $(function() {
        Galleria.loadTheme('/static/galleria-themes/classic/galleria-classic.js');
        var data = #{galleria_json_array(images_dir,out_dir)};
        $('##{html_id}').galleria({
            data_source: data,
            height:300
        });
      });
		</script>
	"""
end

def galleria_json_array(images_dir, out_dir = '')
	ret = []
	extensions = ['.png', '.jpg', '.jpeg', '.gif']
	Dir.foreach(images_dir) do |file_name|
		next if ['.','..'].include? file_name
		ret << {:image => out_dir + file_name} if extensions.include? File.extname(file_name)
	end
	ret.to_json
end
