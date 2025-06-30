local apimodel = require 'models.apimodel'


local M = {}

---
-- Allow user to format text in descriptions.
-- Default implementation replaces @{---} tags with links and apply markdown.
-- @return #string
function M.format(string)
  -- Allow to replace encountered tags with valid links
  local replace = function(found)
    local apiobj = M.getelement(found)
    if apiobj then
      return M.fulllinkto(apiobj)
    end
    return found
  end
  string = string:gsub('@{%s*(.-)%s*}', replace)
  return M.prefixLinesAndTrimDashes(string)
end


function M.formatParameterDescription(input)
  -- Split lines
  local lines = {}
  for line in input:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end

  -- Remove trailing empty or whitespace-only lines
  while #lines > 0 and lines[#lines]:match("^%s*$") do
    table.remove(lines)
  end

  -- Format lines: keep the first as is, prefix the rest
  for i = 2, #lines do
    lines[i] = "---" .. lines[i]
  end

  return table.concat(lines, "\n")
end

---
-- Provide API Model element from a string
-- @usage local externaltyperef = getelement("somemodule#somefield")
function M.getelement( str )

  -- Order matters, more restrictive are at begin of table
  local extractors = {
    globals,
    field,
    extern,
    internal,
    file
  }
  -- Loop over extractors.
  -- First valid result is used
  for _, extractor in ipairs( extractors ) do
    local result = extractor( str )
    if result then return result end
  end
  return nil
end

function M.checkType (str)
  if str then return str end
  return 'NOTYPE'
end

function M.getSuperType(type)
  local supertypename = nil
  if type.supertype and type.supertype.typename then
      supertypename = ": " .. type.supertype.typename
  end
  return supertypename
end

function M.checkDeprecated(...)
    local args = {...}
    for _, arg in pairs(args) do
        if arg:lower():find("deprecated") ~= nil then
            return true
        end
    end
    return false
end

function M.startsWithLower(str)
  if str then
      local byte = str:byte(1)
      return byte >= 97 and byte <= 122  -- ASCII range for 'a' to 'z'
  else
      return false
  end
end

function M.removeBackslashes(str)
  local result = ""
  for i = 1, #str do
      local c = str:sub(i, i)  -- works without string.*
      if c ~= "\\" then
          result = result .. c
      end
  end
  return result
end

function M.removeTrailingBlankLine(text)
  -- Remove one trailing blank line (empty or all whitespace)
  return text:gsub("(\n%s*)$", "")
end

function M.to_string(val)
  if val then
      return val
  else
      return ''
  end
end

function M.getParamNames(params)
   local names = {}
   for _, item in ipairs(params) do
       if item.name then
           table.insert(names, item.name)
       end
   end
   return table.concat(names, ", ")
end

function M.prefixLinesAndTrimDashes(text)
    -- Add --- to each line
    local commented = text:gsub("([^\r\n]*)\r?\n", function(line)
      return "---" .. line .. "\n"
    end):gsub("([^\r\n]+)$", function(line)
      return "---" .. line
    end)
  
    -- Remove trailing "--- " line if it's the last line and empty
    commented = commented:gsub("\n---%s*\n?$", "")
  
    return commented
end

return M