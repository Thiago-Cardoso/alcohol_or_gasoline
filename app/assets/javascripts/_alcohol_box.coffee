$(document).ready ->
  $("#alcohol").inputmask("9.99");
  $("#gasoline").inputmask("9.99");
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
            result = data.value;
            $("#mensagem-alerta").html(data.value);
            if(result == "Gasolina")
               $('#mensagem-alerta').css('color', 'red');
               $("#mensagem-sucess").show();
            else if(result == "Álcool")
               $('#mensagem-alerta').css('color', 'green');
               $("#mensagem-sucess").show();
            else if(result == "vazio")
               $("#mensagem-sucess").hide();
           #  alert("Preencha os campos corretamente");
        return false;