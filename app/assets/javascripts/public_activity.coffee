$(document).ready ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text 'Please Wait...'
        return $.getScript(url)
      else if $('.pagination .previous_page').attr('href')
        $('.pagination').text 'That\'s all folks!'
      return
    return $(window).scroll()
  return
