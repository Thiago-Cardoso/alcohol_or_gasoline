$(document).ready ->
  $("#mensagem-sucess").hide();
  $('form').submit ->
    if $('form').attr('action') == '/challenge'
      $.ajax '/challenge',
          type: 'POST'
          dataType: 'json'
          data: {
                  alcohol: $("#alcohol").val(),
                  gasoline: $("#gasoline").val(),
                }
          error: (jqXHR, textStatus, errorThrown) ->
           
          success: (data, text, jqXHR) ->
            $("#mensagem-sucess").show();
            result = data.value;
            $("#mensagem-alerta").html(data.value);
            if(result == "Gasolina")
               $('#mensagem-alerta').css('color', 'red');
            else
               $('#mensagem-alerta').css('color', 'green');
        return false;