class Ohgiri.Collections.Youtube extends Backbone.Collection
  search: (query) ->
    @fetch
      url: "/youtube/search/#{query}.json"
      error: (e) ->
        alert e
    @