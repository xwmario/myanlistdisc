# name: myanimelist One-Box
# about: Simple Anime display box for Discourse
# version: 0.1



module Onebox
  module Engine
    class myanimelistOnebox
      include Engine
      include JSON

      matches_regexp /http?:\/\/myanimelist\.net\/anime\/.+/

      def url
        slug = @url.match(/http?:\/\/myanimelist\.net\/anime\/(.+)/)[1]
        "http://myanimelist.net/api/anime/#{slug}"
      end

      def to_html
        anime = raw
        "
        <div class='onebox-result'>
          <div class='source'>
            <div class='info'>
              <a href='#{@url}' class='track-link' target='_blank'>
                Anime (#{anime["show_type"]})
              </a>
            </div>
          </div>
          <div class='onebox-result-body'>
            <img src='#{anime["cover_image"]}' class='thumbnail'>
            <h3><a href='#{@url}' target='_blank'>#{anime["title"]}</a></h3>
            <h4>#{anime["genres"].map {|x| x["name"] } * ", "}</h4>
            #{anime["synopsis"]}
          </div>
          <div class='clearfix'></div>
        </div>
        "
      end
    end
  end
end
