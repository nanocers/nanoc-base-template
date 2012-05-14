require 'json'

def galleria(html_id, images_dir, out_dir = '')
	ret="""
		<div id='#{html_id}'></div>

		<script>
			Galleria.loadTheme('galleria/themes/classic/galleria-classic-js-min.js');
			var data = #{galleria_json_array(images_dir,out_dir)};
			$('##{html_id}').galleria({	
					data_source: data,
					height:300
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
