jQuery ->
    $("#meals_table").tablesorter()
    availableTags = [];
    $.ajax '/guests.json',
        success  : (data, status, xhr) ->
        	populateGuestsSuggest(data)
    
    populateGuestsSuggest = (json) ->
    	availableTags.push guest.name for guest in json
    
    $('[databehaviour~=invites-autocomplete]' ).autocomplete({
      source: availableTags
    });