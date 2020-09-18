/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('Login');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}

function loginAjax(){
/*   Simulate error message from the server   */
     shakeModal();
}

function shakeModal(){
	
	
	
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}



function removeCheck() {

    if (confirm("�쉶�썝媛��엯�쓣 痍⑥냼�븯�떆寃좎뒿�땲源�?") == true){   
         //�솗�씤 
         location.href='main_final.html'
    }else{ //痍⑥냼
        return false;
   
    }
}



    function joinCheck() {

        if (confirm("�쉶�썝媛��엯 �븯�떆寃좎뒿�땲源�?") == true){   
             //�솗�씤 
            document.removefrm.submit();
        }else{ //痍⑥냼
            return false;
       
        }
    }


    function closeCheck() {
    
        if (confirm("痍⑥냼 �븯�떆寃좎뒿�땲源�?") == true){   
             //�솗�씤 
            location.href='main_final.html'
        }else{ //痍⑥냼
            return false;
          
        }
    }