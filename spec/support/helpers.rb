def user_login
  user = FactoryGirl.create(:user)
  visit root_path

  click_on 'Login'

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end

def login(user)
  visit root_path

  click_on 'Login'

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end

def admin_login
  user = FactoryGirl.create(:user, role: "admin")
  visit root_path

  click_on 'Login'

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end
