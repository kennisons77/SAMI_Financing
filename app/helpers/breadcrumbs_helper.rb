module BreadcrumbsHelper
    def ensure_breadcrumbs
        @breadcrumbs ||= [ { :title => 'Home', :url => '/' } ]
    end

    def breadcrumbs_add(title, url)
        ensure_breadcrumbs << { :title => title, :url => url }
    end

    def render_breadcrumbs
        render :partial => 'shared/breadcrumbs', :locals => { :bread => ensure_breadcrumbs }
    end
end