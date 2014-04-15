module ApplicationHelper
  def default_meta_tags
    {
      site: "#{t("controller.#{controller_name}")} | #{t('title')}",
      description: t('desc'),
      keywords: t('keywords'), 
      reverse: true,
    }
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end
