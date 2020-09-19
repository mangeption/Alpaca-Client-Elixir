defmodule Alpaca.Tests.Models.Account.Activity do
	use ExUnit.Case

	alias Alpaca.Mock.Mojito

	setup_all do
		Alpaca.Client.setup()
	end

	test "show activity success" do
		Mojito.reply(200, ~s([{"id":"20200603093014199::486a1a31-4d0c-494b-aaca-afa36477ddb8","activity_type":"FILL","transaction_time":"2020-06-03T13:30:14.199812Z","type":"fill","price":"886.55","qty":"5","side":"sell","symbol":"TSLA","leaves_qty":"0","order_id":"c47ff82f-fa83-4083-9121-3623f4b3cb8d","cum_qty":"5"},{"id":"20200603093004179::5fcf57bf-f076-4e6b-97b9-85407d7258f0","activity_type":"FILL","transaction_time":"2020-06-03T13:30:04.17912Z","type":"fill","price":"324.9","qty":"2","side":"sell","symbol":"AAPL","leaves_qty":"0","order_id":"888e4b05-b624-48b9-a6cd-a1edf680acbf","cum_qty":"2"},{"id":"20200603093002274::f8f99c37-0633-4c5b-83cf-0ac21225dbbe","activity_type":"FILL","transaction_time":"2020-06-03T13:30:02.274467Z","type":"fill","price":"1437.01","qty":"5","side":"sell","symbol":"GOOG","leaves_qty":"0","order_id":"3dd828ae-7f70-449f-a54b-28758db2323d","cum_qty":"5"},{"id":"20200602093229623::deef5aa4-42d7-414d-a467-07952a29ce5b","activity_type":"FILL","transaction_time":"2020-06-02T13:32:29.623585Z","type":"fill","price":"889.68","qty":"1","side":"buy","symbol":"TSLA","leaves_qty":"0","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"5"},{"id":"20200602093022170::6e0a9fb0-1505-4021-b7f7-cdc2f86d201a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:22.170536Z","type":"partial_fill","price":"893.5","qty":"4","side":"buy","symbol":"TSLA","leaves_qty":"1","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"4"},{"id":"20200602093021488::83d1ccf5-d406-4441-9b61-2c657f168a7a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:21.488152Z","type":"fill","price":"321.41","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"142b4101-86a9-42f5-b43e-be2f15419c83","cum_qty":"1"},{"id":"20200602093015030::d088575b-d22b-43f0-8581-9273eb36d8bb","activity_type":"FILL","transaction_time":"2020-06-02T13:30:15.030543Z","type":"fill","price":"1431.01","qty":"5","side":"buy","symbol":"GOOG","leaves_qty":"0","order_id":"c8c18333-c7b0-4513-9e26-b66d110f64cd","cum_qty":"5"},{"id":"20200602093005948::a594c3f5-aa4a-4718-b565-12f3e5b68d6b","activity_type":"FILL","transaction_time":"2020-06-02T13:30:05.948784Z","type":"fill","price":"321.25","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"534fcff6-a666-4495-bb61-5c405b39bada","cum_qty":"1"}]))
		{:ok, activities} = Alpaca.Model.Account.Activity.show()
		assert length(activities) == 8
	end

	test "show activity success with filter" do
		Mojito.reply(200, ~s([{"id":"20200603093014199::486a1a31-4d0c-494b-aaca-afa36477ddb8","activity_type":"FILL","transaction_time":"2020-06-03T13:30:14.199812Z","type":"fill","price":"886.55","qty":"5","side":"sell","symbol":"TSLA","leaves_qty":"0","order_id":"c47ff82f-fa83-4083-9121-3623f4b3cb8d","cum_qty":"5"},{"id":"20200603093004179::5fcf57bf-f076-4e6b-97b9-85407d7258f0","activity_type":"FILL","transaction_time":"2020-06-03T13:30:04.17912Z","type":"fill","price":"324.9","qty":"2","side":"sell","symbol":"AAPL","leaves_qty":"0","order_id":"888e4b05-b624-48b9-a6cd-a1edf680acbf","cum_qty":"2"},{"id":"20200603093002274::f8f99c37-0633-4c5b-83cf-0ac21225dbbe","activity_type":"FILL","transaction_time":"2020-06-03T13:30:02.274467Z","type":"fill","price":"1437.01","qty":"5","side":"sell","symbol":"GOOG","leaves_qty":"0","order_id":"3dd828ae-7f70-449f-a54b-28758db2323d","cum_qty":"5"},{"id":"20200602093229623::deef5aa4-42d7-414d-a467-07952a29ce5b","activity_type":"FILL","transaction_time":"2020-06-02T13:32:29.623585Z","type":"fill","price":"889.68","qty":"1","side":"buy","symbol":"TSLA","leaves_qty":"0","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"5"},{"id":"20200602093022170::6e0a9fb0-1505-4021-b7f7-cdc2f86d201a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:22.170536Z","type":"partial_fill","price":"893.5","qty":"4","side":"buy","symbol":"TSLA","leaves_qty":"1","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"4"},{"id":"20200602093021488::83d1ccf5-d406-4441-9b61-2c657f168a7a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:21.488152Z","type":"fill","price":"321.41","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"142b4101-86a9-42f5-b43e-be2f15419c83","cum_qty":"1"},{"id":"20200602093015030::d088575b-d22b-43f0-8581-9273eb36d8bb","activity_type":"FILL","transaction_time":"2020-06-02T13:30:15.030543Z","type":"fill","price":"1431.01","qty":"5","side":"buy","symbol":"GOOG","leaves_qty":"0","order_id":"c8c18333-c7b0-4513-9e26-b66d110f64cd","cum_qty":"5"},{"id":"20200602093005948::a594c3f5-aa4a-4718-b565-12f3e5b68d6b","activity_type":"FILL","transaction_time":"2020-06-02T13:30:05.948784Z","type":"fill","price":"321.25","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"534fcff6-a666-4495-bb61-5c405b39bada","cum_qty":"1"}]))
		{:ok, activities} = Alpaca.Model.Account.Activity.show(activity_types: "FILL,TRANS")
		assert length(activities) == 8
	end

	test "show activity failed" do
		Mojito.error(~s({"code":40010001,"message":"invalid activity type: FFFFF"}))
		{:error, err} = Alpaca.Model.Account.show()
		assert err == ~s({"code":40010001,"message":"invalid activity type: FFFFF"})
	end

	test "index activity success" do
		Mojito.reply(200, ~s([{"id":"20200603093014199::486a1a31-4d0c-494b-aaca-afa36477ddb8","activity_type":"FILL","transaction_time":"2020-06-03T13:30:14.199812Z","type":"fill","price":"886.55","qty":"5","side":"sell","symbol":"TSLA","leaves_qty":"0","order_id":"c47ff82f-fa83-4083-9121-3623f4b3cb8d","cum_qty":"5"},{"id":"20200603093004179::5fcf57bf-f076-4e6b-97b9-85407d7258f0","activity_type":"FILL","transaction_time":"2020-06-03T13:30:04.17912Z","type":"fill","price":"324.9","qty":"2","side":"sell","symbol":"AAPL","leaves_qty":"0","order_id":"888e4b05-b624-48b9-a6cd-a1edf680acbf","cum_qty":"2"},{"id":"20200603093002274::f8f99c37-0633-4c5b-83cf-0ac21225dbbe","activity_type":"FILL","transaction_time":"2020-06-03T13:30:02.274467Z","type":"fill","price":"1437.01","qty":"5","side":"sell","symbol":"GOOG","leaves_qty":"0","order_id":"3dd828ae-7f70-449f-a54b-28758db2323d","cum_qty":"5"},{"id":"20200602093229623::deef5aa4-42d7-414d-a467-07952a29ce5b","activity_type":"FILL","transaction_time":"2020-06-02T13:32:29.623585Z","type":"fill","price":"889.68","qty":"1","side":"buy","symbol":"TSLA","leaves_qty":"0","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"5"},{"id":"20200602093022170::6e0a9fb0-1505-4021-b7f7-cdc2f86d201a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:22.170536Z","type":"partial_fill","price":"893.5","qty":"4","side":"buy","symbol":"TSLA","leaves_qty":"1","order_id":"36e3e15f-6fe2-4a32-8229-543a08a92fbf","cum_qty":"4"},{"id":"20200602093021488::83d1ccf5-d406-4441-9b61-2c657f168a7a","activity_type":"FILL","transaction_time":"2020-06-02T13:30:21.488152Z","type":"fill","price":"321.41","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"142b4101-86a9-42f5-b43e-be2f15419c83","cum_qty":"1"},{"id":"20200602093015030::d088575b-d22b-43f0-8581-9273eb36d8bb","activity_type":"FILL","transaction_time":"2020-06-02T13:30:15.030543Z","type":"fill","price":"1431.01","qty":"5","side":"buy","symbol":"GOOG","leaves_qty":"0","order_id":"c8c18333-c7b0-4513-9e26-b66d110f64cd","cum_qty":"5"},{"id":"20200602093005948::a594c3f5-aa4a-4718-b565-12f3e5b68d6b","activity_type":"FILL","transaction_time":"2020-06-02T13:30:05.948784Z","type":"fill","price":"321.25","qty":"1","side":"buy","symbol":"AAPL","leaves_qty":"0","order_id":"534fcff6-a666-4495-bb61-5c405b39bada","cum_qty":"1"}]))
		{:ok, activities} = Alpaca.Model.Account.Activity.index(type: "FILL")
		assert length(activities) == 8

		assert Enum.all?(activities, fn a -> a.activity_type == "FILL" end) == true
	end
end