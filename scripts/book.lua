-- Compile-time only. Does not edit NIP source files.
-- 1. Nest each NIP under its chapter (H1 NIP-* becomes H2; inner headings shift).
-- 2. Drop --file-scope path prefixes so chunk URLs stay nip-01.html, groups.html, …
-- 3. Prefix in-NIP heading ids with the NIP id so chapters like Relays/Groups
--    are not renamed after a NIP subsection of the same name.
-- 4. Point NIP markdown links at the compiled book instead of raw .md files.

local stringify = pandoc.utils.stringify
local in_nip = false
local current_nip = nil

local function strip_filescope(ident)
  if not ident or ident == "" then
    return ident
  end
  return ident:gsub("^.*__", "")
end

function Header(el)
  local title = stringify(el.content)
  el.identifier = strip_filescope(el.identifier)

  if el.level == 1 and title:match("^NIP%-") then
    in_nip = true
    current_nip = title:lower()
    el.level = 2
    el.identifier = current_nip
    return el
  elseif el.level == 1 then
    in_nip = false
    current_nip = nil
    return el
  elseif in_nip then
    el.level = el.level + 1
    if current_nip and el.identifier and el.identifier ~= "" then
      el.identifier = current_nip .. "-" .. el.identifier
    end
    return el
  end
  return el
end

local function nip_file(target)
  local path, frag = target:match("^(.-)%.md(#.+)$")
  if not path then
    path = target:match("^(.-)%.md$")
    frag = ""
  end
  if not path then
    return nil, nil
  end
  local file = path:gsub("^[%./]+", ""):gsub("^.*/", "")
  -- NIP filenames are hex (01, 5A, EE, …), not README.md and friends.
  if not file:match("^%x+$") then
    return nil, nil
  end
  return file:lower(), frag or ""
end

local function filescope_hash(target)
  local ident = target:match("^#(.*__.*)$")
  if not ident then
    return nil
  end
  local cleaned = ident:gsub("^.*__", ""):lower()
  local nipfile = ident:match("^nips__([^/]+)%.md__")
  if nipfile and nipfile:match("^%x+$") then
    local nip = "nip-" .. nipfile:lower()
    if cleaned == nip then
      return "#" .. nip
    end
    return "#" .. nip .. "-" .. cleaned
  end
  return "#" .. cleaned
end

function Link(el)
  local file, frag = nip_file(el.target)
  if file then
    local id = "nip-" .. file
    if FORMAT == "chunkedhtml" then
      if frag ~= "" then
        el.target = id .. ".html#" .. id .. "-" .. frag:sub(2)
      else
        el.target = id .. ".html"
      end
    elseif frag ~= "" then
      el.target = "#" .. id .. "-" .. frag:sub(2)
    else
      el.target = "#" .. id
    end
    return el
  end
  local rewritten = filescope_hash(el.target)
  if rewritten then
    el.target = rewritten
  end
  return el
end
