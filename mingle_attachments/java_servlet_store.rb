#--
# Copyright (c) 2010 Engine Yard, Inc.
# Copyright (c) 2007-2009 Sun Microsystems, Inc.
# This source code is available under the MIT license.
# See the file LICENSE.txt for details.
#++

module ActionController
  module Session
    # Rack-session-compatible store that uses the Java Servlet session
    # to store data. Creates no additional cookies since that's
    # handled by the servlet framework.
    class JavaServletStore
      RAILS_SESSION_KEY = "__current_rails_session"

      class JavaServletSessionHash < AbstractStore::SessionHash
        def finish_save
          if @loaded || !@env[AbstractStore::ENV_SESSION_KEY].equal?(self)
            if !@env[AbstractStore::ENV_SESSION_OPTIONS_KEY][:id].nil?
              @by.save_session(@env, to_hash)
            else
              @by.close_session(@env)
            end
          end
        end

        # Allows direct delegation to servlet session methods when session is active
        def method_missing(meth, *args, &block)
          servlet_session = @by.get_servlet_session(@env, false)
          if servlet_session && servlet_session.respond_to?(meth)
            servlet_session.send(meth, *args, &block)
          else
            super
          end
        end
      end

      def initialize(app, *ignored)
        @app = app
      end

      def call(env)
        raise "JavaServletStore should only be used with JRuby-Rack" unless env['java.servlet_request']

        begin
          session = JavaServletSessionHash.new(self, env)
          env[AbstractStore::ENV_SESSION_KEY] = session
          env[AbstractStore::ENV_SESSION_OPTIONS_KEY] = {:id => false}
          @app.call(env)
        ensure
          session.finish_save
        end
      end

      def load_session(env)
        session_id, session = false, {}
        if servlet_session = get_servlet_session(env)
             begin
               session_id = servlet_session.getId
               servlet_session.synchronized do
                 servlet_session.getAttributeNames.each do |key|
                   if key == RAILS_SESSION_KEY
                     marshalled_bytes = servlet_session.getAttribute(RAILS_SESSION_KEY)
                     if marshalled_bytes
                       data = Marshal.load(String.from_java_bytes(marshalled_bytes))
                       session.update data if Hash === data
                     end
                   else
                     session[key] = servlet_session.getAttribute key
                   end
              end
            end
             rescue java.lang.IllegalStateException # session invalid
               session_id = nil
             end
        end
        [session_id, session]
      end

        def save_session(env, hash)
          if env[AbstractStore::ENV_SESSION_OPTIONS_KEY][:id].nil? && hash.empty?
            destroy_session(env)
            return true
          end
          if servlet_session = get_servlet_session(env, true)
            begin
              servlet_session.synchronized do
                keys = servlet_session.getAttributeNames
                keys.select { |key| ! hash.has_key?(key) }.each do |key|
                  servlet_session.removeAttribute(key)
                end
                hash.delete_if do |key,value|
                  if String === key
                    case value
                    when String, Numeric, true, false, nil
                      servlet_session.setAttribute key, value
                      true
                    else
                      if value.respond_to?(:java_object)
                        servlet_session.setAttribute key, value
                        true
                      else
                        false
                      end
                    end
                  end
                end
                if ! hash.empty?
                  marshalled_string = Marshal.dump(hash)
                  marshalled_bytes = marshalled_string.to_java_bytes
                  servlet_session.setAttribute(RAILS_SESSION_KEY, marshalled_bytes)
                elsif servlet_session.getAttribute(RAILS_SESSION_KEY)
                  servlet_session.removeAttribute(RAILS_SESSION_KEY)
                end
              end
              return true
            rescue java.lang.IllegalStateException # session invalid
              return false
            end
          else
            return false
          end
        end

      def get_servlet_session(env, create = false)
        unless env['java.servlet_session']
          servlet_session = env['java.servlet_request'].getSession(create)
          (env[AbstractStore::ENV_SESSION_OPTIONS_KEY] ||= {})[:id] = servlet_session.getId if create
          env['java.servlet_session'] = servlet_session
        end
        env['java.servlet_session']
      end

      def close_session(env)
        (session = get_servlet_session(env)) and session.invalidate
      end
    end
  end
end
