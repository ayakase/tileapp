$(document).ready(function () {
    var drop_down_products = $("#header-products").mouseenter(
        () => {
            $("#header-products-dropdown").stop(true, true).slideDown("fast")
            $(".out-products-dropdown").mouseleave( ()=> {
                $("#header-products-dropdown").slideUp("fast")
            })
        }
    );
    
    drop_down_products.mouseleave( () => {
        $(".out-products-dropdown").mouseleave( ()=> {
            $("#header-products-dropdown").slideUp("fast")
        })
    });
    
    
    
    var drop_down_news = $("#header-news").mouseenter(
        () => {
            $("#header-news-dropdown").stop(true, true).slideDown("fast")
            $(".out-news-dropdown").mouseleave( ()=> {
                $("#header-news-dropdown").slideUp("fast")
            })
        }
    );
    
    drop_down_news.mouseleave( () => {
        $(".out-news-dropdown").mouseleave( ()=> {
            $("#header-news-dropdown").slideUp("fast")
        })
    });

    var login = $(".login-popup-parent");
    var login_popup = $(".login-popup");

    login.click(function (e) {
        if(login_popup.css('display') == 'none') {
            login_popup.fadeIn("fast");
            login_popup.css('display', 'flex');
        } else if(login_popup.css('display') == 'flex') {
            login_popup.fadeOut(500);
        }
    });

    var user_info = $(".user-dropdown-parent");
    var user_dropdown = $(".user-dropdown");

    user_info.click(function (e) {
        if(user_dropdown.css('display') == 'none') {
            user_dropdown.fadeIn("fast");
            user_dropdown.css('display', 'flex');
        } else if(user_dropdown.css('display') == 'flex') {
            user_dropdown.fadeOut(500);
        }
    });
});
