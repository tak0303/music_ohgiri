class Ohgiri.Views.AddSongs extends Backbone.View

  initialize: ->

  events:
    'click .add_song'   : 'addSong'
    'click .remove_song': 'removeSong'

  addSong: (e) ->
    clone = $(e.target).parent().clone()
    video_id = $(e.target).parent().data('video-id')
    clone.find('.add_song')
         .removeClass('add_song')
         .addClass('remove_song')
         .attr('value','remove')
    $("#songs_list").append clone

  removeSong: (e) ->
    clone = _.clone $(e.target).parent()
    video_id = $(e.target).parent().data('video-id')
    clone.find('.remove_song')
         .removeClass('remove_song')
         .addClass('add_song')
         .attr('value','add')
    $("#search_result").prepend clone

  saveToList: (video_id) ->
    $.ajax
      url: '/playlist/#{playlist_id}/add/#{video_id}'
      type: 'post'
      dataType: 'json'
      data: 'video_id': video_id
      error: (jqXHR, textStatus, errorThrown) ->
        alert 'error'
      success: (data) ->
        $('body').append "Successful AJAX call: #{data}"