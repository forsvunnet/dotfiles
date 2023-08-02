local function get_namespace()
    local filename = vim.fn.expand('%:p')
    local parts = {}
    local filename_parts = {}
    for part in filename:gmatch("[^\\/]+") do
        if part ~= nil then
            table.insert(filename_parts, part)
        end
    end
    local lower_count = 0
    for i = #filename_parts, 1, -1 do
        local part = filename_parts[i]
        if part:match("^[A-Z]") then
            if not part:match("\\.") then
                table.insert(parts, 1, part)
            end
        else
            lower_count = lower_count + 1
            if lower_count>2 then
                break
            end
        end
    end
    -- Check if the last part is a file (contains a dot '.' character)
    local last_part = parts[#parts]
    if last_part and last_part:find("%.") then
        table.remove(parts, #parts) -- Remove the last part if it's a file
    end
    return table.concat(parts, "\\")
end

local function get_file_class_name()
    local filename = vim.fn.expand('%:p')
    local basename = filename:match("[^\\/]+$")  -- Get the last segment of the file path
    basename = basename:gsub("%..*$", "")      -- Remove the file extension
    return basename
end

return {
    s(
        {
            trig = "<?",
            desc = "<?php with namespaced class",
        }, {
            t({"<?php", "", "namespace "}),
            extras.partial(get_namespace),
            t({";", "", "class "}), extras.partial(get_file_class_name),
            t({"", "{", "    "}), i(1),
            t({"", "}", ""}),
        }
    ),
    s(
        {
            trig = "nc",
            desc = "namespaced class",
        }, {
            t("namespace "), extras.partial(get_namespace),
            t({";", "", "class "}), extras.partial(get_file_class_name),
            t({"", "{", "    "}), i(1),
            t({"", "}", ""}),
        }
    ),
    s(
        {
            trig = "ns",
            desc = "namespace",
        }, {
            t("namespace "), extras.partial(get_namespace), t(";")
        }
    ),
    s(
        {
            trig = "cl",
            desc = "class",
        }, {
            t({"class "}), extras.partial(get_file_class_name),
            t({"", "{", "    "}), i(1),
            t({"", "}", ""}),
        }
    ),
    s(
        {
            trig = "cn",
            desc = "class name",
        }, {
            extras.partial(get_file_class_name),
        }
    )
}
