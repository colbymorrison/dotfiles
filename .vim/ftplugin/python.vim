let g:ale_python_pyls_executable = '/usr/bin/pylsp'
let g:ale_python_black_executable='/usr/bin/black'
let b:ale_fixers = ['black']
let b:ale_linters = ['pyls', 'pyre']

let g:ale_lint_on_enter = 1
let g:ale_python_autopep8_use_global=1
let g:ale_python_isort_use_global=1
let g:ale_python_mypy_use_global=1
let g:ale_python_mypy_options='--ignore-missing-imports'
let g:ale_python_pycodestyle_use_global=1
let g:ale_python_pylint_use_global=1
let g:ale_python_yapf_use_global=1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_completion_enabled = 1
