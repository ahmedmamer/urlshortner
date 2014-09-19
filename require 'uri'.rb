require 'uri'

class UrlShorter
  @@urls = Hash.new()

  # set base url
  def initialize(base_url)
    @base_url = base_url
  end

  # create long url to short url
  # @param String url
  def create(url)
    if /^http/.match(url)
      route = get_path()  

      @@urls.store(route, url)
      @base_url.concat(route)
    end
  end
  # redirect shorten url to long url
  # @param string url
  def redirect(url)
    if !url.nil?
      path = filter_route(url)
      @@urls[path]
    end
  end
  # parse url and extract path
  # @param string url
  def filter_route(url)
    uri = URI(url)
    if !uri.path.nil?
      path = uri.path
      path.slice!('/')
      path
    else
      raise ArgumentError, "This url is incorrect"
    end
  end


  def get_path()
    (0..4).map {
      (65 + rand(26)).chr
    }.join
  end
  # private methods
  private :filter_route, :get_path
end