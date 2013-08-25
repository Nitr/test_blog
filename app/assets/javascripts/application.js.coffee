# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .

$ ->
  check_required_fileds = (form) ->
    disabled = ""
    $(form).find("input.required, textarea.required, select.required").each ()->
      if $(this).val() == "" || $(this).val() == null
        disabled = "disabled"
    $(form).find("input:submit").prop("disabled", disabled)

  change_required_filed = () ->
    $form = $(this).parents("form")
    check_required_fileds($form)

  $forms = $("form")
  $forms.each ()->
    check_required_fileds(this)
  
  $forms.find("input.required, textarea.required").on "keyup", change_required_filed
  $forms.find("select.required").on "change", change_required_filed
