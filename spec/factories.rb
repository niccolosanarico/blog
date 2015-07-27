FactoryGirl.define do
    factory :user do
        name     "Nico Sana"
        email    "nico@niccolosanarico.com"
        password "nicopamy"
        password_confirmation "nicopamy"
    end

    factory :post do
        title   "new post"
        body    "new post body"
        status  "published"
    end

    factory :link do
        title     "new link"
        link      "http://www.google.com"
        section   "Links"
    end
end
