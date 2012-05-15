@@gallery_count = 0


def aw_image_slide(src, caption)
  """
    <div class='showcase-slide'>
        <div class='showcase-content'>
            <div class='showcase-content-wrapper'>
                <img class='showcase-image' src='#{src}'></img>
            </div>
        </div>
        <div class='showcase-caption'>
            #{caption}
        </div>
    </div>
  """
end

def aw_vid_slide(src, caption)
  vid = """<iframe class='showcase-vid' src='#{src}' frameborder='0' allowfullscreen></iframe>"""
  aw_slide(vid, caption)
end

def aw_showcase(id='')
  id = "showcase-#{@@gallery_count}" if id == ''
  """
  <div id='#{id}' class='showcase'>
    #{yield}
  </div>
  """
end

def aw_slide(content, caption)
  """
    <div class='showcase-slide'>
        <div class='showcase-content'>
            <div class='showcase-content-wrapper'>
                %s
            </div>
        </div>
        <div class='showcase-caption'>
            %s
        </div>
    </div>
  """%[content,caption]
end