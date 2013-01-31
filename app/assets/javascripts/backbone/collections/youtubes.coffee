class Ohgiri.Collections.Youtube extends Backbone.Collection
  search: (query,page=1) ->
    @fetch
      async: false
      url: "/youtube/search/#{encodeURI query}/#{page}.json"
      error: (e) ->
        alert 'error'
    @