def visit_spaces_click_add
  visit('/spaces')
  click_button "Add Space"
end

def fill_in_name_desc_price
  fill_in('name', with: "Deathstar")
  fill_in('description', with: "The description")
  fill_in('price', with: "10")
  click_button "submit"
end

def fill_in_name_and_dates
  fill_in('name', with: "Deathstar")
  # expects DD/MM/YY
  fill_in('startdate', with: '01/01/20')
  fill_in('enddate', with: '31/01/20')
  click_button "submit"
end
