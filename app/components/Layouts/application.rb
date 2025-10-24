class Layout < Phlex::HTML
  include Phlex::Rails::Layout

  def view_template
    doctype
    html do
      head do
        title { content_for(:title) || "Inventory" }
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        meta(name: "apple-mobile-web-app-capable", content: "yes")
        meta(name: "application-name", content: "Inventory")
        meta(name: "mobile-web-app-capable", content: "yes")
        whitespace
        csrf_meta_tags
        whitespace
        csp_meta_tag
        whitespace
        plain yield :head
        whitespace
        # Enable PWA manifest for installable apps (make sure to enable in config/routes.rb too!)
        whitespace
        # = tag.link rel: "manifest", href: pwa_manifest_path(format: :json)
        link(rel: "icon", href: "/icon.png", type: "image/png")
        link(rel: "icon", href: "/icon.svg", type: "image/svg+xml")
        link(rel: "apple-touch-icon", href: "/icon.png")
        whitespace
        stylesheet_link_tag :app, "data-turbo-track": "reload"
        whitespace
        javascript_importmap_tags
      end
      body do
        whitespace
        main(
          class:
            "container mx-auto mt-28 px-5 flex h-screen bg-gray-50 dark:bg-gray-900"
        ) do
          whitespace
          plain yield
          whitespace
        end
      end
    end
  end
end