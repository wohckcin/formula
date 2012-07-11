# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-datepicker
#= require jquery.chosen
#= require jquery.timeago
#= require jquery.timeago.settings
#= require_tree .

$ ->
  # bootstrap-dropdown 
  $('.dropdown-toggle').dropdown()

  # Cliend-side timeago by jQuery
  $('abbr.timeago').timeago().tooltip()

  # Select Chosen 样式
  $('.chosen').chosen()

  # bootstrap-tooltips
  $('.tips').tooltip()

  # bootstrap style like datepicker
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
    language: 'zh-CN' 

  $(".alert").alert()

window.App =
    # 警告信息显示, to 显示在那个dom前(可以用 css selector)
  alert : (msg,to) ->
    $(".alert").remove()
    $(to).before("<div class='alert'><a class='close' href='#' data-dismiss='alert'>x</a>#{msg}</div>")

  # 成功信息显示, to 显示在那个dom前(可以用 css selector)
  notice : (msg,to) ->
    $(".alert").remove()
    $(to).before("<div class='alert alert-success'><a class='close' data-dismiss='alert' href='#'>x</a>#{msg}</div>")

  likeable : (el) ->
    $el = $(el)
    likeable_type = $el.data("type")
    likeable_id = $el.data("id")
    likes_count = parseInt($el.data("count"))
    if $el.data("state") != "liked"
      $.ajax
        url : "/likes"
        type : "POST"
        data :
          type : likeable_type
          id : likeable_id

      likes_count += 1
      $el.data("state","liked").data('count', likes_count).attr("title", "取消喜欢")
      $('span',el).text("#{likes_count}人喜欢")
      $("i.icon",el).attr("class","icon small_liked")
    else
      $.ajax
        url : "/likes/#{likeable_id}"
        type : "DELETE"
        data :
          type : likeable_type
      if likes_count > 0
        likes_count -= 1
      $el.data("state","").data('count', likes_count).attr("title", "喜欢")
      if likes_count == 0
        $('span',el).text("喜欢")
      else
        $('span',el).text("#{likes_count}人喜欢")
      $("i.icon",el).attr("class","icon small_like")
    false