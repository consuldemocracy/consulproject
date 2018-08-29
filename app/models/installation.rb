class Installation < ActiveRecord::Base
  delegate :last_commit, :lines_diff, :files_changed, :diff_url, to: :github
  enum organization_type: {
    government: 'government',
    ong: 'ong',
    university: 'university',
    school: 'school',
    other: 'other',
  }
  enum installation_status: {
    in_progress: 'in_progress',
    in_production: 'in_production',
  }

  def github
    Installation::Github.new(self)
  end

end
