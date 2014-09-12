require "utm_cookies/version"

module UtmCookies

  def save_utm_cookies
    source = params[:utm_source]
    medium = params[:utm_medium]
    campaign = params[:utm_campaign]
    term = params[:utm_term]
    content = params[:utm_content]

    #not sure we'll be using this one... But it would be the google click id for adwords
    gclid = params[:gclid]

    if source != nil
      #if the source changed, start a new session
      if cookies[:utm_source] != source
        cookies.delete :session_cookie
      end
      cookies.permanent[:utm_source] = source
    else
      source = "(direct)"
      if cookies[:utm_source].nil?
        cookies.permanent[:utm_source] = source
      end
    end

    if medium != nil
      #if the medium changed, start a new session
      if cookies[:utm_medium] != medium
        cookies.delete :session_cookie
      end
      cookies.permanent[:utm_medium] = medium
    else
      medium = "(none)"
      if cookies[:utm_medium].nil?
        cookies.permanent[:utm_medium] = medium
      end
    end

    if campaign != nil
      #if the campaign changed, start a new session
      if cookies[:utm_campaign] != campaign
        cookies.delete :session_cookie
      end
      cookies.permanent[:utm_campaign] = campaign
    else
      campaign = "(direct)"
      if cookies[:utm_campaign].nil?
        cookies.permanent[:utm_campaign] = campaign
      end
    end

    if term != nil
      #if the term changed, start a new session
      cookies.delete(:session_cookie) if cookies[:utm_term] != term
      cookies.permanent[:utm_term] = term
    end

    if content != nil
      #if the content changed, start a new session
      cookies.delete(:session_cookie) if cookies[:utm_content] != content
      cookies.permanent[:utm_content] = content
    end
  end

  class << self
    def included(receiver)
      receiver.before_action :save_utm_cookies     
    end
  end
end
