local M = {}

M.load_api_key = function()
    local openai_api_key_path = vim.fn.expand('$HOME') .. '/openai/token'
    local openai_api_key = vim.fn.readfile(openai_api_key_path, '', 1)
    vim.fn.setenv('OPENAI_API_KEY', openai_api_key[1])
end



local config = {
  -- config changes go here
}

M.setup = function()
    local ok, chatgpt = pcall(require, 'chatgpt')
    if not ok then
        vim.notify("missing module chatgpt", vim.log.levels.WARN)
        return
    end
    chatgpt.setup(config)
end


return M
