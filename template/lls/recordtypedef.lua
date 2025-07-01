return [[#
# --
# -- Descriptions
# --
# local gv = templateparams[2]
# if gv ~= nil and gv.shortdescription and gv.shortdescription ~= "" then
$( format( gv.shortdescription))
# end
# if gv ~= nil and gv.description and gv.description ~= "" then
$(format(gv.description))
# end
#
#if _recordtypedef.shortdescription and _recordtypedef.shortdescription ~= "" and #_recordtypedef.shortdescription > 0 then
$( format( _recordtypedef.shortdescription ) )
#end
#if _recordtypedef.description and _recordtypedef.description ~= "" and #_recordtypedef.description > 0 then
$( format( _recordtypedef.description ) )
#end
# --
# -- Check class deprecated
# --
# if checkDeprecated(_recordtypedef.shortdescription, _recordtypedef.description) or (gv ~= nil and checkDeprecated(gv.shortdescription, gv.description)) then
---@deprecated
# end
# --
# -- Class name
# --
---@class $(_recordtypedef.name) $(getSuperType(_recordtypedef))
# --
# -- Get class fields
# --
# if _recordtypedef.fields then
#    for name, item in sortedpairs(_recordtypedef.fields) do
#       if item.type then
#           local typedef = item:resolvetype()
#           if not typedef or typedef.tag ~= 'functiontypedef' then
$(removeTrailingBlankLine(applytemplate(item, i+1, "lls")))
#           end
#       end
#   end   
# end
$(_recordtypedef.name) = {}

# if _recordtypedef.fields then
#   for name, item in sortedpairs(_recordtypedef.fields) do
#       if item.type then
#           local typedef = item:resolvetype()
#           if typedef and typedef.tag == 'functiontypedef' then
$(removeTrailingBlankLine(applytemplate(item, i+1, "lls")))
# --
# -- Is function private?
# --
# if startsWithLower(item.name) then
---@private
# end
function $(removeBackslashes(prettyname(item))) end

#           end
#       end
#   end
# end
]]
