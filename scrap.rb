$base_url = "https://www.facebook.com/"

def create_url_for_id(name)
  $base_url + name
end

name_test = "modernboxrecords"

create_url_for_id(name_test)
