#establish_connection to api here.

  def get_gifs_from_api
    api_data = RestClient.get('https://api.giphy.com/v1/gifs/search?api_key=NC8kOxUoGiQZ5cor2YJV8MLrm1vlxLWY&q=cats&limit=25&offset=0&rating=PG&lang=en')
    JSON.parse(api_data)
  end

# make a method that returns array of titles
  def titles
    get_gifs_from_api["data"].map do |gif|
      gif["title"]
    end
  end

  # loop over an array
  # split each string
  def get_keywords
    titles.map do |title|
      title.split(" ")
    end
  end

  def keywords
    get_keywords.flatten
  end


  def get_title_url_from_api
    title_url = {}
    get_gifs_from_api["data"].map do |data|
      title_url[data["title"]] = data["url"]
    end
    title_url
  end

# Iterate through the title url hash
# grab all the titles
# make strings in to a (title) array
# find the first object within the title array
