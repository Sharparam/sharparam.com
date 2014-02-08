<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
    before_action :load_<%= singular_table_name %>, only: :create
    load_and_authorize_resource

    # GET <%= route_url %>
    def index
    end

    # GET <%= route_url %>/1
    def show
    end

    # GET <%= route_url %>/new
    def new
    end

    # GET <%= route_url %>/1/edit
    def edit
    end

    # POST <%= route_url %>
    def create
        if @<%= orm_instance.save %>
            redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
        else
            render action: 'new'
        end
    end

    # PATCH/PUT <%= route_url %>/1
    def update
        if @<%= orm_instance.update("#{singular_table_name}_params") %>
            redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
        else
            render action: 'edit'
        end
    end

    # DELETE <%= route_url %>/1
    def destroy
        @<%= orm_instance.destroy %>
        redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
    end

    private
        # Only allow a trusted parameter "white list" through.
        def <%= "#{singular_table_name}_params" %>
            <%- if attributes_names.empty? -%>
            params[<%= ":#{singular_table_name}" %>]
            <%- else -%>
            params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
            <%- end -%>
        end

        def load_<%= singular_table_name %>
            @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
        end
end
<% end -%>
