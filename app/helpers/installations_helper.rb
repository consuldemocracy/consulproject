module InstallationsHelper

  def organization_type_for_select
    Installation.organization_types.map do |organization_type, _|
      [I18n.t("activerecord.attributes.installation.organization_types.#{organization_type}"), organization_type]
    end
  end

  def installation_status_for_select
    Installation.installation_statuses.map do |installation_status, _|
      [I18n.t("activerecord.attributes.installation.installation_statuses.#{installation_status}"), installation_status]
    end
  end

end
