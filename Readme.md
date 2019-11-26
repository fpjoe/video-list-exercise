# video-list-exercise
Exercise: API for retrieving a simple list of videos using Ruby on Rails and PostgreSQL.

# To Run

Visit: https://video-list-exercise.herokuapp.com/videos

Possible parameters (all parameters are **optional**):
* song_title = title of song, case-insensitive
* artist_title = title of artist, case-insensitive
* city_title = title of city, case-insensitive
* page = page number, defaults to 1
* per_page = number per page, defaults to 25

Things I might do next if I had time:

* Add **sorting**: optionally pass sort parameter, defaulting to video_uid ascending, e.g. 'sort=video_uid_A'
* Add **authentication**: pass in an API key
