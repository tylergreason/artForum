require 'rest-client'
require 'json'

# url = 'https://collectionapi.metmuseum.org/public/collection/v1/objects'
# url = 'https://collectionapi.metmuseum.org/public/collection/v1/search?q=hasImage=true'
url = 'https://collectionapi.metmuseum.org/public/collection/v1/search?q=hasImage=true'
response = RestClient.get(url)
images = JSON.parse(response)
pp images['objectIDs'].count
random_image_id = images['objectIDs'].sample

image_data = JSON.parse(RestClient.get("https://collectionapi.metmuseum.org/public/collection/v1/objects/#{random_image_id}"))
pp image_data 
# Metropolitan Museum piece url: 
museum_url = image_data["objectURL"]
p "Museum page: #{museum_url}"
artist_name = image_data["artistDisplayName"]
# pp image_data


# use wikipedia API to search for the article in question 
url = "http://en.wikipedia.org/w/api.php?action=query&format=json&list=search&srsearch=#{artist_name}&format=json&prop=info&inprop=url"
wikipedia_page = JSON.parse(RestClient.get(url))
wikipedia_page_id = wikipedia_page["query"]["search"][0]["pageid"].to_s
# pp wikipedia_page_id
p "https://en.wikipedia.org/wiki/?curid=#{wikipedia_page_id}"

