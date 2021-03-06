require 'calabash-android/abase'

class HeaderTabBarPage < Calabash::ABase
   
 
    @@tabbar = "tabBarButton"

    @@getmenu = "* id:'cnt_up'"
    @@refresh = "* id:'cnt_buttons'"
    @@hometitle = "* text:'Front Page'"
    @@threedots = "* id:'icv_overflow'"
    @@search = "* id:'edit_search'"
    @@nightmode = "* id:'icv_night_mode'"
    @@daymode = "* id:'icv_day_mode'"
    @@smaller = "* id:'icv_text_smaller'"
    @@bigger = "* id:'icv_text_bigger'"
    @@ayemm = "-14277082"
    @@peeemm = "-1710619"
    @@mnutitle  = "* text:'Hacker News 2'"
    @@term = "{'defaultColor'=>-14277082, 'stateful'=>false}"
    

#--------------------------------------------
    def director(choice)
        sleep 2
        wait_for_elements_exist([@@hometitle], :timeout => 20)
        case choice
            when "Menu" then touch(@@getmenu)
            when "Refresh" then touch(@@refresh)
            when "Stack" then touch(@@threedots)
        end
        sleep 3
   end
    
#----------------------------------------------
    def menu_check
        wait_for_elements_exist(@@mnutitle)
        sleep 3
    end

    def sun_screen
            colordef = query("fontText", :getTextColors) [1]
            colordef = colordef.to_s

        if colordef.include? @@ayemm then
            puts "This is daymode"
            touch(@@nightmode)
            sleep 3
            touch(@@threedots)
            touch(@@daymode)
        else
            puts "This is nightmode"
            touch(@@daymode)
            sleep 3
            touch(@@threedots)
            touch(@@nightmode)
        end
    end

    def text_adjust
        touch(@@smaller)
        for i in 0..2
            director("Stack")
            touch(@@bigger)
        end
        for i in 0..1
            director("Stack")
            touch(@@smaller)
        end
   end
end

