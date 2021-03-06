# video-list-exercise
Exercise: API for retrieving a simple list of videos using Ruby on Rails and PostgreSQL.

# To run

Visit: https://video-list-exercise.herokuapp.com/videos

Possible parameters (all parameters are **optional**):
* song_title = title of song, case-insensitive
* artist_title = title of artist, case-insensitive
* city_title = title of city, case-insensitive
* page = page number, defaults to 1
* per_page = number per page, defaults to 25

Results are returned in order of video_uid ascending.

Examples:
* https://video-list-exercise.herokuapp.com/videos?song_title=Open+Heart
* https://video-list-exercise.herokuapp.com/videos?artist_title=Bobby+Long&city_title=Austin
* https://video-list-exercise.herokuapp.com/videos?city_title=Austin&page=2&per_page=5

# Known issues

* Results not returning artist and city info, only video and song info (serialization issue?)

# Things I might do next if I had time:

* Add **API versioning**: current version of API should be v1
* Add **sorting**: pass optional sort parameter, defaulting to video_uid ascending, e.g. 'sort=video_uid_A'
* Add **authentication**: pass required API key
* DRY work on seeds.rb, videos_spec.rb
* Redirect root url (/) to API url (/videos)
* Return error if unrecognized parameter passed
