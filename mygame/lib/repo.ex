defmodule Repo do
	@moduledoc """
	define a repository to handle actor_info in store
	"""

	def openmyfile() do
    :dets.open_file(:disk_storage_actor_info,[type: :set])
  	end
    @doc """ 
    init actor info
     """
	def init_actor_info(id) do
      :dets.insert_new(:disk_storage_actor_info, {id, 
      %{name: "9527", level: 100, 
      	actor_main_info: %{money: 2000000000, exp: 30000000, owned_ingot: 100},
       	pray_info: %{exp_pray_times: 8, money_pray_times: 8, last_pray_time: 0},
       	sign_in_info: %{total_sign_days: 0, last_sign_day: 0, is_today_signed: false, sign_history: 0}} })
    ##{ok: table} = :dets.open_file(:disk_storage,[type: :set])	
	end
    
    def lookup(id) do
    	avatar_info= :dets.lookup(:disk_storage_actor_info,id) |> hd |>elem(1)
  	   	if avatar_info == []  do
     	  #{error, Reason}
     	else
     	  avatar_info
   	  end
    end

	def update(id, data) do
    	:dets.insert(:disk_storage_actor_info, {id, data})
		
	end

	def delete(id) do
		:dets.delete(:disk_storage_actor_info, id) 
		#-> ok | {error, Reason}
	end
    
	def closemyfile() do
  	:dets.close(:disk_storage_actor_info) 
  	#-> ok | {error, Reason}
  	end


end