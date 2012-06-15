# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  Topics.initCloseWarning($('textarea.closewarning'))

  # Topics.hookPreview($(".editor_toolbar"), $(".topic_editor"))








window.Topics =
  preview: (content) ->
    $('#preview').text "Loading..."

    $.post "/topics/preview",
      "content": content,
      (data) ->
        $("#preview").html data.body
      "json"

  hookPreview: (switcher, textarea) ->
    # put div#preview after textarea
    preview_box = $(document.createElement("div")).attr "id", "preview"
    preview_box.addClass("body")
    $(textarea).after preview_box
    preview_box.hide()

    $(".edit a",switcher).click ->
      $(".preview",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).hide()
      $(textarea).show()
      false
    $(".preview a",switcher).click ->
      $(".edit",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).show()
      $(textarea).hide()
      Topics.preview($(textarea).val())
      false

  initCloseWarning: (el, msg) ->
    return false if el.length == 0
    msg = "离开本页面将丢失未保存页面!" if !msg
    $("input[type=submit]").click ->
      $(window).unbind("beforeunload")
    el.change ->
      if el.val().length > 0
        $(window).bind "beforeunload", (e) ->
          if $.browser.msie
            e.returnValue = msg
          else
            return msg
      else
        $(window).unbind("beforeunload")

  # Ajax 回复后的事件
  replyCallback : (success, msg) ->
    $('#main .alert-message').remove()
    if success
      $('abbr.timeago', $('#replies-show .reply-item').last()).timeago().tooltip()
      $('#new_reply')[0].reset()
      App.notice(msg,'#reply')
    else
      App.alert(msg,'#reply')