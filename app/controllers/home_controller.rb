class HomeController < ApplicationController
  def numbtype
  end

  def resulttable
    if params[:startstring].nil?
      @outputlistsum = Cplist.all
      return
    end
    #빈칸있을시 처리방법###
    # if params[:bookname].nil?
    #   params[:bookname] = ""
    # end
    @str_front  = params[:startstring]
    @str_end    = params[:endstring]
    
    @num_start  = params[:startnum].to_i
    @num_end    = params[:endnum].to_i
    

    (@num_start..@num_end).each do |n|
      @sumstring = @str_front + n.to_s + @str_end
      
        uri = URI("#{@sumstring}")
        html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
      
        eachlist = Cplist.new
      
        #이름
        if html_doc.css("td")[0]
          eachlist.cpname = html_doc.css("td")[0].inner_text
        else
          eachlist.cpname = "no name"
        end
        
        #사용기간
        if html_doc.css("td")[0]
          eachlist.cpdate = html_doc.css("td")[1].inner_text
        else
          eachlist.cpdate = "no date"
        end
        
        #조건
        if html_doc.css("td")[0]
          eachlist.cpcondition = html_doc.css("td")[2].inner_text
        else
          eachlist.cpcondition = "no cdn"
        end
        
        #발급수량
        if html_doc.css("td")[0]
          eachlist.cpamount = html_doc.css("td")[3].inner_text
        else
          eachlist.cpamount = "no amount"
        end
        
        #링크저장
        eachlist.cplink = @sumstring
      
        eachlist.save
        
        sleep 5.5
    end
    
    
    @outputlistsum = Cplist.all
    
  end




  def passby
  end
end
