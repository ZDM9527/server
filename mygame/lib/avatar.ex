defmodule Avatar do
# import Repo
# import sign_in_info
# import Pray
#慎用import 不同模块遇到同名函数会造成歧义
	@moduledoc """ 
	actor
	"""
	def ava_sign_in(id) do
		#avatar_info = Repo.lookup(id)
		#new_sign = avatar_info[:sign_in_info] |> Sign_in.sign_in 

		#Repo.update(id,avatar_info |> Map.put(:sign_in_info, new_sign))  

		process(id, fn data ->
			data |> Map.update!(:sign_in_info, &Sign_in.sign_in/1)
		end)
	end

	def show_sign_history(id) do
		#avatar_info = Repo.lookup(id)
        #avatar_info[:sign_in_info] |> Sign_in.detail_sign_history
        process(id, fn data ->
				Sign_in.sign_in(data |> Map.fetch([:sign_in_info]))
		end)
	end
    
    def ava_exp_pray(id) do
    	# avatar_info = Repo.lookup(id)
    	# new_pray = avatar_info[:pray_info] |> Pray.exp_pray 
    	# Map.put(avatar_info, :pary_info, new_pray)
    	# Repo.update(id, Map.put(avatar_info, :pary_info, new_pray))
    	process(id, fn data ->
			data |> Map.update!(:pray_info, &Pray.exp_pray/1)
		end)

    end

    defp process(id, func) do
    	Repo.update(id, func.(Repo.lookup(id)))
   	end

    def ava_money_pray(id) do
    	# avatar_info = Repo.lookup(id)
    	# new_pray = avatar_info[:pray_info] |> Pray.money_pray
    	# Map.put(avatar_info, :pary_info,new_pray)
    	# |> Repo.update(id)
    	process(id, fn data ->
			data |> Map.update!(:pray_info, &Pray.money_pray/1)
		end)
    end

	def show_actor_status(id)  do
		avatar_info = Repo.lookup(id)
  	   	if avatar_info == []  do
     	  "There is nothing to show"
     	else
     	  avatar_info
   	  	end
    end
end