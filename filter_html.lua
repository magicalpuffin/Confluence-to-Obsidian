-- filter_html.lua

function Span(el)
  return el.content
end
  
function Div(el)
  -- Removes footer
  if el.identifier == "footer" then
    return {}
  end
  -- Removes breadcrumb header
  if el.identifier == "breadcrumb-section" then
    return {}
  end
  -- Removes attachments plugin
  if el.classes:includes("plugin_attachments_container") then
    return {}
  end
  return el.content
end

function Para(el)
  if el.content then
    for _, item in ipairs(el.content) do
      -- Out of order execution, converted links should not be stringified
      if item.t == "RawInline" then
        return el
      end
    end
    return pandoc.utils.stringify(el.content)
  end
end

function Image(el)
  return {}
end

function Link(el)
  -- if el.classes:find("download-all-link", 0) then
  --   return {}
  -- end
  if el.classes:includes("external-link") then
    link_text = pandoc.utils.stringify(el.content)
    link_url = el.target
    markdown_link = string.format("[%s](%s)", link_text, link_url)

    return {pandoc.RawInline("gfm", markdown_link)}
  end
end

-- function Table(el)
--   if el.classes:find("attachments", 0) then
--     return {}
--   end
-- end
  
