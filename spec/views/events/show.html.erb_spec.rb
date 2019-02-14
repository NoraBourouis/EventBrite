require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
    it 'displays event details correctly' do
      assign(:event, Event.create(title: "Anniversaire"))
  
      render
  
      rendered.should contain("Anniversaire")
    end
end
