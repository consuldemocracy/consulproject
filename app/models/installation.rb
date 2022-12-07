class Installation < ActiveRecord::Base
  delegate :last_commit, :lines_diff, :files_changed, :diff_url, to: :github

  enum organization_type: {
    government: 'government',
    ngo: 'ngo',
    university: 'university',
    school: 'school',
    other: 'other',
  }
  enum installation_status: {
    in_progress: 'in_progress',
    in_production: 'in_production',
  }

  validates :name, presence: true
  validates :repo, presence: true, uniqueness: true

  def github
    Installation::Github.new(self)
  end

end
