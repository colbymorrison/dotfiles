let g:ale_python_pyls_executable = '/opt/homebrew/bin/pylsp'
let g:ale_python_black_executable='/opt/homebrew/bin/black'
let b:ale_fixers = ['black']
let b:ale_linters = ['pylsp']

let g:ale_lint_on_enter = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_completion_enabled = 1
