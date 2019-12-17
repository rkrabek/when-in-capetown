require "sinatra"

get "/" do
    @days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
	erb :index
end
    
get "/days/:day" do
	@days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
	@day_name = params["day"]
	activities = {
        'monday' => [
            ["Free walking tour", "https://www.active.com/Assets/Walking/460/diet-detective-walk-for-your-health.jpg"],
            ["Local Brewery Visit","http://yakimachief.com/wp-content/uploads/2011/04/beer_brewery.jpg"],
            ["Hop on Hop Off Bus Tour","http://www.capetown.travel/cache/ce_cache/made/new-sight-seeing_1_380_279_80.jpg"],
            ["Chapman's Peak Drive","http://www.thatscapetown.co.za/wp-content/uploads/2010/06/chapmans-peak-drive1.jpg"],
            ["Kloofing/Canyoning","http://www.dirtyboots.co.za/images/sized/themes/site_themes/dirtyboots/images/uploads/kloofing1_thumb-490x368.jpg"],
        ],
        'tuesday' => [
            ["Free Beer 6pm-6:15pm","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSNKA7dhzoi-r0aZWAYdznmbSz6lcp1SMFESwbIcRccw0DPYQPC"],
            ["Live Jazz Bar","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRrNutCxJRRYnyWrTU5oI3CGpLetS3xboIR7qTRbts2U85fc4u7"],
            ["Movie at the Labia Theater","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPLxU5-nxHDAbxZCqlLaO7RjKtw92E8Tpb3XHzti9NvMDPCJa2kg"],
            ["Explore Bo Kaap","http://upload.wikimedia.org/wikipedia/commons/7/76/Bo-Kaap_scene.jpg"],
            ["Whale Watching in Hermanus","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFCKg8AClSfhqUqvvwUlyv-bPSwlLVq8hEtRI_PcssL7RFK717"]
        ],
        'wednesday' => [
            ["Feed Squirels in the Company Gardens","http://i.ytimg.com/vi/4yikpWtIFU8/maxresdefault.jpg"],
            ["The Assembly","http://www.goingout.co.za/wp-content/uploads/sites/3/2012/10/The-Assembly-Cape-Town.jpg"],
            ["Picnic at Kirstenbasch","http://www.capetown.travel/cache/ce_cache/made/Kirstenbosch_(2)_380_252_80.jpg"],
            ["Penguins at Boulders Beach","http://www.thatscapetown.co.za/wp-content/uploads/Boulders-Beach-Beach-of-The-Penguins_tourism_6.jpg"],
            ["Garden Route","http://www.pemburytours.com/system/images/BAhbB1sHOgZmSSIwMjAxMi8xMS8wMS8xMi8wMS81My80NzAvY2FwZV90b3duX3Bob3RvLmpwZwY6BkVUWwg6BnA6CnRodW1iSSIOODAweDUxMCNjBjsGVA/cape-town-photo.jpg"]
        ],
        'thursday' => [
            ["Lion's Head","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRvgJDAshvVa6e7p5ub-dL0U_1-qi_zIDaRow-Qs5PyCKn8VLeykojCig"],
            ["Fiction","http://citizen.co.za/wp-content/uploads/sites/18/2014/04/CitySpreadA-4.jpg?091c3b"],
            ["Surfing in Muizenberg","image_url"],
            ["Earth Fair Market","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRUwIwt3n1Vak1ZxPG7wa2jWMWYr7bJ9_xYEmaPf5MhoZk0JkCv4w"],
            ["Sunset in Blouberg","http://www.noxrentals.co.za/blog/wp-content/uploads/2012/09/table_mountain_sunset_from_blouberg_strand.jpg"]
        ],
        'friday' => [
            ["Braai Night","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRPKdtvFcMJdjqt3cuMrMgmAcwpGEsrEdBmkYvKfWri4PM_EOP15Q"],
            ["The Waiting Room","http://i.ytimg.com/vi/L9-mlJvNkDc/hqdefault.jpg"],
            ["Cape Peninsula","http://www.kaapstad.org/Kaapstad%20English/Accommodation/Hotels%20Cape/cape%20peninsula.jpg"],
            ["Sea Point Promenade at Sunset","http://its-service.infinityweb.co.za/Image.ashx?Id=2741"],
            ["Wine Tour","http://s.hswstatic.com/gif/wine-tour-1.jpg"]
        ],
        'saturday' => [
            ["Hike Table Mountain","http://www.hiketablemountain.co.za/wp-content/uploads/2012/06/Grootkop-client-hike-050.jpg"],
            ["The Crypt Jazz Restaurant","http://www.capetownmagazine.com//media_lib/r2/151ea29b87a7b0ef46f35aed80de4acc.img.jpg"],
            ["Old Biscuit Mill","http://neighbourgoodsmarket.co.za/assets/img/about-fullscreen.jpg"],
            ["Oranjezicht City Farm Market","http://insideguide.co.za/content/uploads/2014/11/best-markets-cape-town-oranjezight-city-farm-market.jpg"],
            ["Shark Cage Diving","http://www.dirtyboots.co.za/themes/site_themes/dirtyboots/images/uploads/Shark_Cage_Diving_KZN.jpg"]
        ],
        'sunday' => [
            ["Explore Local Coffee Shops","http://www.yatzer.com/assets/Article/3237/images/shanna-jones-photography-yatzer-truth-coffee-shop-cape-town-1.jpg"],
            ["V & A Waterfront","https://c1.staticflickr.com/9/8264/8667491072_03c8b7a0f0_b.jpg"],
            ["Enjoy Fish & Chips in Kalk Bay","http://www.capetown.travel/cache/ce_cache/made/kalk_bay_306_230_80.jpg"],
            ["High Tea at the Mount Nelson Hotel","http://www.villascampsbay.co.uk/camps-bay-news/wp-content/uploads/2015/04/british-mount-nelson.jpg"],
            ["Skydiving/Paragliding","http://wcet2016.com/images/tourism_page/paragliding.jpg"]
        ]
    }
    @to_do = activities[@day_name]
    erb :day
end

get "/contact_us" do
    @days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
    erb :contact_us
end