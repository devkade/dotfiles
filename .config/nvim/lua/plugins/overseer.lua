return {
  "stevearc/overseer.nvim",
  config = function()
    -- overseer.nvim 설정
    require("overseer").setup()

    -- C++ 파일용 작업 등록
    require("overseer").register_template({
      name = "Compile and Run C++", -- 작업 이름
      builder = function()
        -- 현재 버퍼 파일명을 가져와서 g++으로 컴파일하고 실행
        local file = vim.api.nvim_buf_get_name(0)
        local binary = file:gsub("%.cpp$", "")
        return {
          cmd = "g++", -- C++ 컴파일러 명령어
          args = { file, "-o", binary },
          cwd = vim.fn.getcwd(),
          components = { "default" },
          on_success = {
            cmd = "./" .. binary, -- 컴파일 성공 시 실행
          },
        }
      end,
      condition = {
        filetype = { "cpp" }, -- C++ 파일에만 적용
      },
      priority = 50,
    })

    -- C 파일용 작업 등록
    require("overseer").register_template({
      name = "Compile and Run C", -- 작업 이름
      builder = function()
        -- 현재 버퍼 파일명을 가져와서 gcc로 컴파일하고 실행
        local file = vim.api.nvim_buf_get_name(0)
        local binary = file:gsub("%.c$", "")
        return {
          cmd = "gcc", -- C 컴파일러 명령어
          args = { file, "-o", binary },
          cwd = vim.fn.getcwd(),
          components = { "default" },
          on_success = {
            cmd = "./" .. binary, -- 컴파일 성공 시 실행
          },
        }
      end,
      condition = {
        filetype = { "c" }, -- C 파일에만 적용
      },
      priority = 50,
    })
  end,
}
