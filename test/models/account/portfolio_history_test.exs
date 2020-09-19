defmodule Alpaca.Tests.Models.Account.PortfolioHistory do
	use ExUnit.Case

	alias Alpaca.Mock.Mojito

	setup_all do
		Alpaca.Client.setup()
	end

	test "show portfolio history success" do
		Mojito.reply(200, ~s({"timestamp":[1589203800,1589290200,1589376600,1589463000,1589549400,1589808600,1589895000,1589981400,1590067800,1590154200,1590499800,1590586200,1590672600,1590759000,1591018200,1591104600,1591191000,1591277400,1591363800,1591623000,1591709400,1591819200],"equity":[100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100031.91,100006.21,100006.21,100006.21,100006.21,100006.21,100006.21],"profit_loss":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31.91,17.02,0,0,0,0,0],"profit_loss_pct":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.0003191,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0],"base_value":100000,"timeframe":"1D"}))
		{:ok, history} = Alpaca.Model.Account.PortfolioHistory.show()
		assert history == %{
			timestamp: [1589203800,1589290200,1589376600,1589463000,1589549400,1589808600,1589895000,1589981400,1590067800,1590154200,1590499800,1590586200,1590672600,1590759000,1591018200,1591104600,1591191000,1591277400,1591363800,1591623000,1591709400,1591819200],
			equity: [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100031.91,100006.21,100006.21,100006.21,100006.21,100006.21,100006.21],
			profit_loss: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31.91,17.02,0,0,0,0,0],
			profit_loss_pct: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.0003191,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0.0004893000000000458,0],
			base_value: 100000,
			timeframe: "1D"
		}
	end
end