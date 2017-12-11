defmodule Sign_in do
use Bitwise
	@moduledoc """
	realize the function of recording the sign_in days,and distribute awards respectively according to rules
	"""
	def sign_in(sign_info) do
		is_today_signed = sign_info[:is_today_signed]
		#sign_history = sign_info[:sign_history]

		#get current day
 		current_date = Timex.today
 		current_day =current_date.day

 		#repeat sign in in same day
 		if(current_date != sign_info[:last_sign_day]) do
 		 %{sign_info|is_today_signed: false}
        end
        #Today is not sign in
 		if(!is_today_signed) do 
 		    #receive everyday's award  rules:10 ignots
 		    temp1  = trunc(:math.pow(2,32 - current_day))
        	temp2  = sign_info[:sign_history]
		   %{sign_info|is_today_signed: true, total_sign_days: sign_info[:total_sign_days]+1,
         	last_sign_day: current_date, sign_history: (temp2 ||| temp1)}
 			
 		else
 			#"You have recerived the award"
 		end
 		# cond do
 		# 	(sign_info[:total_sign_days] = 2) ->
 		# 		#
 		# 	(sign_info[:total_sign_days] = 7) ->
 		# 	(sign_info[:total_sign_days] = 14) ->

 		# 		#	
 		# 	(sign_info[:total_sign_days] = 21) ->
 		# 		#
 		# 	(sign_info[:total_sign_days] = 28) ->
 		# 		#	
 		# end
 		  #

    end


    def detail_sign_history(sign_info) do
       temp = sign_info[:sign_history]
      for  i <- 32 ..1 do
        if( (temp &&& ( 1 <<< (32 - i) )) != 0) do
        ~c/#{i}=>Y/
         #time = time - 1
        else
        ~c/#{i}=>N/
        end
      end
      |> :lists.reverse()
  end
end