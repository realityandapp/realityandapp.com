#$.rails.allowAction = (link) ->
  #return true unless link.attr('data-confirm')
  #$.rails.showConfirmDialog(link) # look bellow for implementations
  #false # always stops the action since code runs asynchronously

#$.rails.confirmed = (link) ->
  #link.removeAttr('data-confirm')
  #link.trigger('click.rails')
  #console.log('confirmed')

#$.rails.showConfirmDialog = (link) ->
  #message = link.attr 'data-confirm'
  #html = """
#<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
#<div class="modal-dialog" id="confirmationDialog">
#<div class="modal-content">
#<div class="modal-header">
#<a class="close" data-dismiss="modal">×</a>
#<h3 class="modal-title">#{message}</h3>
#</div>
#<div class="modal-body">
#<p>你确定吗?</p>
#</div>
#<div class="modal-footer">
#<a data-dismiss="modal" class="btn btn-default">Cancel</a>
#<a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
#</div>
#</div>
#</div>
#</div>
#"""
  #$(html).modal()
  #$('a.confirm').click ->
    #$.rails.confirmed(link)
    #console.log link
  #console.log $('#confirmationDialog .confirm')
