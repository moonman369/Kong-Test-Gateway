-- Filename: path-parameters-plugin.lua

local BasePlugin = require "kong.plugins.base_plugin"

local PathParametersPlugin = BasePlugin:extend()

PathParametersPlugin.PRIORITY = 999 -- set the priority of the plugin

function PathParametersPlugin:new()
  PathParametersPlugin.super.new(self, "path-parameters")
end

function PathParametersPlugin:access(plugin_conf)
  PathParametersPlugin.super.access(self)

  local uri = kong.request.get_path() -- get the request URI
  local path_parameters = {}

  -- Extract path parameters from the URI
  for key, value in string.gmatch(uri, "/([^/]+)/([^/]+)") do
    path_parameters[key] = value
  end

  -- Set the path parameters in Kong's request object
  kong.ctx.shared.path_parameters = path_parameters

  -- Extract a particular path parameter that you want to send in the outbound request
  local desired_parameter = path_parameters["desired_parameter_key"]

  -- Add the desired parameter to the upstream request headers or query parameters
  kong.service.request.set_path(uri)
end

return PathParametersPlugin
