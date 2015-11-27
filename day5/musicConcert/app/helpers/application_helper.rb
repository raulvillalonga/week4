module ApplicationHelper

  def flash_message
    display_message(:alert) || display_message(:notice)         
  end

  private

  def display_message(tipo)
    if flash[tipo]
      content_tag :div, class: "message #{tipo}" do 
        content_tag :p do 
          flash[tipo]
        end
      end
    end    
  end

end
