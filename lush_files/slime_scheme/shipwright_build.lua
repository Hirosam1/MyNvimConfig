local lushwright = require("shipwright.transform.lush")
run(require("lua/lush_theme/slime_scheme"),
  -- generate lua code
  lushwright.to_lua,
  -- write the lua code into our destination.
  -- you must specify open and close markers yourself to account
  -- for differing comment styles, patchwrite isn't limited to lua files.
  {patchwrite, "/home/hirosam/.config/nvim/lush_files/slime_scheme/slimeling.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE"})
