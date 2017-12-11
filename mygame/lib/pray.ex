defmodule Pray do
	@moduledoc """
  	A pray moodule of mygame.
 	"""
 	def money_pray(money_pray_info) do
      current_time = System.system_time(:second)
    	if (current_time - money_pray_info[:last_pray_time] < (8*60*60))  do ##far last freepray over 8hours  free_pray
        	if(money_pray_info[:money_pray_times] < 0) do
              #"failed to money_pray,absent ingot or money_pray_times"
            	else
             	 %{money_pray_info|money_pray_times:  money_pray_info[:money_pray_times] -1}
        	end
      		else
          %{money_pray_info|last_pray_time:  current_time}
        end

    end

    def exp_pray(exp_pray_info) do
    	current_time = System.system_time(:second)
        ##exp_pray_times is over,cannot continue
        if(exp_pray_info[:exp_pray_times] < 0) do
        	exp_pray_info
          #"failed to exp_pray,absent ingot or exp_pray_times"
          else
            ##pray for experience
            %{exp_pray_info|exp_pray_times: exp_pray_info[:exp_pray_times]-1, last_pray_time:  current_time}
        end
   end
end