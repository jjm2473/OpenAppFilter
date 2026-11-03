module("luci.controller.oaf", package.seeall)

function index()
    entry({"admin", "services", "oaf"}, firstchild(), _("Parental Control"), 20).dependent = true
    entry({"admin", "services", "appfilter"}, call("redirect_to_oaf")).leaf = true
end

function redirect_to_oaf(path, ...)
    local newargs = {}
    if path ~= nil then
        newargs = {path == "user_list" and "users" or path == "user" and "whitelist" or path == "time" and "mac_filter" or path == "advance" and "advanced" or path, ...}
    end
    luci.http.redirect(luci.dispatcher.build_url("admin", "services", "oaf", unpack(newargs)))
end
