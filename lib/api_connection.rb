#establish_connection to api here.

  def get_gifs_from_api
    api_data = RestClient.get('https://api.giphy.com/v1/gifs/search?api_key=NC8kOxUoGiQZ5cor2YJV8MLrm1vlxLWY&q=cats&limit=25&offset=0&rating=PG&lang=en')
    JSON.parse(api_data)
    binding.pry
  end

  def get_title_from_api
    hash["data"].map do |el|
      el["title"]
    end
  end
