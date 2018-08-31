require 'rails_helper'

feature 'Installations management' do
  before(:each) {
    create_list(:installation, 3)

    Installation.any_instance.stub(:last_commit).and_return(Faker::Date.between(2.days.ago, Date.today))
    Installation.any_instance.stub(:github).and_return(self)
    Installation.any_instance.stub(:lines_diff).and_return(Faker::Number.number(2))
    Installation.any_instance.stub(:diff_url).and_return(Faker::Internet.url('github.com'))
    Installation.any_instance.stub(:files_changed).and_return([Faker::File.file_name])
  }

  scenario 'Index', :js do

    visit installations_path

    expect(page).to have_link(I18n.t('helpers.link.new', model: 'Installation'), href: new_installation_path)
    expect(page).to have_css "h2.installation__header--title", count: 3

  end

  scenario 'New', :js do
    visit new_installation_path

    fill_in :name.to_s.humanize, with: Faker::Lorem.sentence
    fill_in :repo.to_s.humanize, with: Faker::Internet.url('github.com')
    fill_in :website.to_s.humanize, with: Faker::Internet.url
    fill_in :contact_name.to_s.humanize, with: Faker::Name.name_with_middle
    fill_in :conact_email.to_s.humanize, with: Faker::Internet.email
    fill_in :location.to_s.humanize, with: Faker::Address.full_address
    find_field(:organization_type.to_s.humanize).select(I18n.t('activerecord.attributes.installation.organization_types.government'))
    find_field(:status.to_s.humanize).select(I18n.t('activerecord.attributes.installation.installation_statuses.in_progress'))
    fill_in :notes.to_s.humanize, with: Faker::Lorem.paragraph

    click_button I18n.t('helpers.submit.create', model: 'Installation')

    expect(page).to have_content I18n.t('installations.show.files_changed')
    expect(page).to have_link I18n.t('installations.show.changes_in_github')
  end
end
