class PagesController < ApplicationController
    def about
        @heading = "Этот новостной сайт принадлежит Вячеславу А"
        @text = "Этот сайт создавался для понимания языка Ruby и фреймворка RoR"
    end
end
