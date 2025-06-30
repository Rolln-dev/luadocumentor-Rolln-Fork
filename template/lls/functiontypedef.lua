return [[#
# local fdef = _functiontypedef
# local ignorefirstparam = templateparams[1]
# local ignoredescription = templateparams[2]
# local originallink = templateparams[3]
# --
# -- Function Descriptions
# --
# if not ignoredescription then
#   if fdef.shortdescription then
$( format(fdef.shortdescription) )
#   end
#   if fdef.description and #fdef.description > 0 then
$( format(fdef.description) )
#   end
---
------
# end
# --
# -- Function usage
# --
# if fdef.metadata and fdef.metadata.usage then
$(removeTrailingBlankLine(applytemplate(fdef.metadata.usage, i, "lls") ))
# end
# --
# -- Function parameters
# --
# -- Adjust parameter count if first one is 'self'
# local paramcount
# if #fdef.params > 0 and ignorefirstparam then
#   paramcount = #fdef.params - 1
# else
#   paramcount = #fdef.params
# end
# if paramcount > 0 then
#   for position, param in ipairs( fdef.params ) do
#       if not (position == 1 and ignorefirstparam) then
$(removeTrailingBlankLine(applytemplate(param, i+1, "lls")))
#       end
#   end
# end
# --
# -- Function returns
# --
# if fdef and #fdef.returns > 0 then
#   for _, ret in ipairs(fdef.returns) do
$(removeTrailingBlankLine(applytemplate(ret, i+1, "lls")))
#   end
# end
# -- # --
# -- # -- Describe returns types
# -- # --
# -- # if fdef and #fdef.returns > 0 then
# --     <h$(i)><strong>Return value$(#fdef.returns > 1 and 's'):</strong></h$(i)>
# -- #   --
# -- #   -- Format nice type list
# -- #   --
# -- #   local function niceparmlist( parlist )
# -- #     local typelist = {}
# -- #     for position, type in ipairs(parlist) do
# -- #       local link = linkto( type )
# -- #       local name = purename( type )
# -- #       if link then
# -- #         typelist[#typelist + 1] = '<a href="'..link..'">'..name..'</a>'
# -- #       else
# -- #         typelist[#typelist + 1] = name
# -- #       end
# -- #       -- Append end separator or separating comma 
# -- #       typelist[#typelist + 1] = position == #parlist and ':' or ', '
# -- #     end
# -- #     return table.concat( typelist )
# -- #   end
# -- #   --
# -- #   -- Generate a list if they are several return clauses
# -- #   --
# --     <div class="w3-row w3-border-bottom w3-margin-left">
# -- #   if #fdef.returns > 1 then
# -- #     for position, ret in ipairs(fdef.returns) do
# -- #
# -- #       local paramlist = niceparmlist(ret.types)
# --         <div class="w3-half">
# -- #       if #ret.types > 0 and #paramlist > 0 then
# --           <p>$( paramlist )</p>
# -- #       end
# --         </div>
# --         <div class="w3-half">
# --           $( format ( ret.description ) )
# --         </div>
# -- #     end
# -- #   else
# -- #     local paramlist = niceparmlist(fdef.returns[1].types)
# -- #     local isreturn = fdef.returns and #fdef.returns > 0 and #paramlist > 0
# -- #     local isdescription = fdef.returns and fdef.returns[1].description and #format(fdef.returns[1].description) > 0
# -- #
# -- #     -- Show return type if provided
# --       <div class="w3-half">
# -- #     if isreturn then
# --         <p>$( paramlist )</p>
# -- #     end
# --       </div>
# --       <div class="w3-half">
# -- #     if isdescription then
# --         $( format ( fdef.returns[1].description ) )
# -- #     end
# --       </div>
# -- #   end
# --     </div>
# -- # end
# -- #
# -- #--
# -- #-- Show usage samples
# -- #--
# -- #if fdef.metadata and fdef.metadata.usage then
# --   $( applytemplate(fdef.metadata.usage, i) )
# -- #end
# -- </div>
]]