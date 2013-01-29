class Ohgiri.Views.AddSongs extends Backbone.View

  initialize: ->

  events:
    'click .add_song': 'addSong'
    'click .remove_song': 'removeSong'

  addSong: (e) ->
    clone = _.clone $(e.target).parent()
    clone.find('.add_song')
         .removeClass('add_song')
         .addClass('remove_song')
         .attr('value','remove')
    $("#songs_list").append clone

  removeSong: (e) ->
    clone = _.clone $(e.target).parent()
    clone.find('.remove_song')
         .removeClass('remove_song')
         .addClass('add_song')
         .attr('value','add')
    $("#search_result").prepend clone