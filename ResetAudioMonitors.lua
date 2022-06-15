--[[
----------------------------------------------------------
Audio Source Monitor reset script by JakubLovesHorror
https://jakubloveshorror.com/
https://github.com/midnight-studios/obs-lua
----------------------------------------------------------
]]

obs = obslua

desc = [[<center><p>Reset your Audio Source monitor settings with one button!</p></center>]]

function script_description()
	return desc
end


function reset_sources_audio()
  local sources = obs.obs_enum_sources()
    if sources ~= nil then
        for _, source in ipairs(sources) do
            local initial_monitor_type = obs.obs_source_get_monitoring_type(source)
            obs.obs_source_set_monitoring_type(source, 0)
            obs.obs_source_set_monitoring_type(source, initial_monitor_type)
        end
        obs.source_list_release(sources)
    end
end

function script_properties()
	local props = obs.obs_properties_create()
  local btn = obs.obs_properties_add_button(props, "new_btn", "Reset Audio Monitors", reset_sources_audio)
	return props
end