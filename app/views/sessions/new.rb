# frozen_string_literal: true

class Views::Sessions::New < Views::Base
  include Phlex::Rails::Helpers::EmailField
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::PasswordField
  include Phlex::Rails::Helpers::Routes

  def view_template
    div(class: "flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900") do
      div(class: "flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800") do
        div(class: "flex flex-col overflow-y-auto md:flex-row") do
          div(class: "h-32 md:h-auto md:w-1/2") do
          end
          div(class: "flex items-center justify-center p-6 sm:p-12 md:w-1/2") do
            div(class: "w-full") do
              if alert = flash[:alert]
                p( class:
                    "py-2 px-3 bg-red-50 mb-5 text-red-500 font-medium rounded-lg inline-block",
                  id: "alert"
                ) { alert }
                whitespace
              end
              whitespace
              if notice = flash[:notice]
                p( class:
                    "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block",
                  id: "notice"
                ) { notice }
                whitespace
              end
              h1(class: "mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200") { "Sign in" }
              whitespace
              form_with url: session_url, class: "contents" do |form|
                div(class: "my-5") do
                  whitespace
                  plain form.email_field :email_address, required: true, autofocus: true, autocomplete: "username",
                                         placeholder: "Enter your email address",
                                         class:
                                           "block shadow-sm rounded-md border border-gray-400 focus:outline-blue-600 px-3 py-2 mt-2 w-full"
                end
                div(class: "my-5") do
                  whitespace
                  plain form.password_field :password, required: true, autocomplete: "current-password",
                                            placeholder: "Enter your password", maxlength: 72,
                                            class:
                                              "block shadow-sm rounded-md border border-gray-400 focus:outline-blue-600 px-3 py-2 mt-2 w-full"
                end
                div(class: "col-span-6 sm:flex sm:items-center sm:gap-4") do
                  div(class: "inline") do
                    whitespace
                    plain form.submit "Sign in",
                                      class:
                                        "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
                  end
                  div(class: "mt-4 text-sm text-gray-500 sm:mt-0") do
                    whitespace
                    link_to "Forgot password?",  new_password_path, class: "text-gray-700 underline hover:no-underline"
                  end
                end
                whitespace
              end
            end
          end
        end
      end
    end
  end
end
